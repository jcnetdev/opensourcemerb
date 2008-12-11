require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/screenshots" do
  before(:each) do
    @response = request("/screenshots")
  end
end