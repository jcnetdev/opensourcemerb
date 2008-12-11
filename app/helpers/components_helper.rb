module Merb
  module ComponentsHelper
    # render a component in a block
    def component(component_name, options={}, &block)
      throw_content(:for_layout, block_given? ? capture(&block) : "")
      partial("components/#{component_name}", options)
    end
    
  end
end