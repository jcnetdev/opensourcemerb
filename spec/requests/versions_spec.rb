require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/versions" do
  before(:each) do
    @response = request("/versions")
  end
end