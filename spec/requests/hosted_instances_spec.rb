require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/hosted_instances" do
  before(:each) do
    @response = request("/hosted_instances")
  end
end