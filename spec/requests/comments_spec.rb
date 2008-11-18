require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/comments" do
  before(:each) do
    @response = request("/comments")
  end
end