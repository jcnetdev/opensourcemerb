require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/projects" do
  before(:each) do
    @response = request("/projects")
  end
end