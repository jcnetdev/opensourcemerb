module Merb
  module ProjectsHelper
    def activity_display(activity, options = {})
      partial "activities/activity", options.merge(:activity => activity)
    end

    def activity_target_link(activity)    
      if activity.project_id and activity.target_id
        target_link = nil

        # yeeeaah, we have to do this the long way in order to save N+1 database calls
        if activity.target_class == "Comment"
          target_link = url(:project_comment, :project_id => activity.project_id, :id => activity.target_id)
        elsif activity.target_class == "HostedInstance"
          target_link = url(:project_hosted_instance, :project_id => activity.project_id, :id => activity.target_id)
        elsif activity.target_class == "Version"
          target_link = url(:project_version, :project_id => activity.project_id, :id => activity.target_id)
        elsif activity.target_class == "Screenshot"
          target_link = url(:project_screenshot, :project_id => activity.project_id, :id => activity.target_id)
        end

        link_to_if target_link, activity.target_name, target_link
      else
        return activity.target_name
      end

    end

    def bookmark_control(project)
      haml_tag :span, :class => "bookmark-control" do
        if current_user and current_user.bookmarked?(project)
          haml_concat link_to_image("favorite.png", url(:project_bookmark, project), :method => :delete, :title => "Click to Remove Bookmark")
          haml_concat link_to("Unbookmark it...", url(:project_bookmark, project), :method => :delete)
        else
          haml_concat link_to_image("favorite-off.png", url(:project_bookmark, project), :method => :post, :title => "Click to Add Bookmark")
          haml_concat link_to("Bookmark It", url(:project_bookmark, project), :method => :post)
        end
        haml_concat " | "
        haml_concat "Bookmarked by "+pluralize(project.bookmarks.size, "person")
      end    
    end

    # Render a mini bookmark button with count
    def bookmark_mini(project)
      haml_tag :span, :class => "bookmark-mini" do
        # Add Bookmark Button
        bookmark_count = pluralize(project.bookmarks.size, "person")+" bookmarked this application"
        if current_user and current_user.bookmarked?(project)
          haml_concat link_to_image("favorite-mini.png", url(:project_bookmark, project), :method => :delete, :title => bookmark_count, :class => "bookmark-button remove")
        else
          haml_concat link_to_image("favorite-off-mini.png", url(:project_bookmark, project), :method => :post, :title => bookmark_count, :class => "bookmark-button add")
        end
      end
    end

    def rating_explain(project)
      "Rated by #{pluralize(project.rated_count, 'person')} with an average of "+sprintf("%.01f.", project.rating_average || 0)
    end

    def voting(project, detailed = false)

      haml_tag :div, :class => "votes" do
        if detailed
          bookmark_control(project)
        else        
          # Add Download Button
          unless project.download_url.blank?
            haml_concat tag(:span, link_to_image("download-mini.png", url(:download_project, project), :title => "Download Latest Version"))
          end        

          # Render the mini bookmark buttons
          bookmark_mini(project)

          # Add Comments Button
          haml_concat tag(:span, link_to_image("comments2-mini.png", url(:project_comments, project), :title => pluralize(project.comments.size, "comment")))
        end
      end
    end

    def check_empty(collection, name = nil, &block)
      if collection.nil? or collection.empty?
        inner_html = capture_haml(&block) if block_given?

        haml_tag(:p, "There are no #{name} currently associated with this application. #{inner_html}", :class => "empty")


      end
    end

    def search_or_tag_title
      if @tag
        label = pluralize(@tag.taggings.size, 'project')
        title = "#{label} tagged with \"<strong>#{@tag.name}</strong>\""
      elsif @search_term and @projects.respond_to?(:total_entries)
        label = pluralize(@projects.total_entries, "search result")
        title = "Found #{label} for \"<strong>#{@search_term}</strong>\""
      end

      # format the title with an h3
      unless title.blank?
        return tag(:h3) do 
          link_to("Clear Results", {:q => ""}) + 
          title
        end
      end
    end

    # Display an approve button for a project (if permissions allow)
    def approve_button(project)

      if logged_in? and admin?

        haml_tag :div, :class => "actions text-center" do
          haml_concat br
          haml_concat link_to(image_tag("big-approve-button.png"),
                          url(:approve_project, @project), 
                          :method => :put,
                          :confirm => "This will promote the application to the gallery.")
        end
      end
    end

    # Display an approve button for a project (if permissions allow)
    def delete_button(project)
      if admin?
        haml_tag :div, :class => "actions text-center" do
          haml_concat br
          haml_concat link_to("Delete Project",
                          resource(@project), 
                          :method => :delete,
                          :confirm => "This delete this project and all related information. There is no UNDO. Continue?")
        end
      end
    end

    # display comment edit/delete if applicable
    def comment_actions(comment)
      if comment.owned_by?(current_user)
        link_actions = [link_to("Edit Comment", url(:edit_project_comment, @project, comment)),
                        link_to("Delete Comment", url(:project_comment, @project, comment), :method => :delete, :confirm => "Are you sure you want to delete this?")]

        tag(:div, link_actions.join(" | "), :class => "actions")
      end
    end
    
  end
end