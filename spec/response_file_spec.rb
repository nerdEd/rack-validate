require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rack::Validate::ResponseFile do
  before(:each) do
    @initialization_string = "Some String"
    @response_file = Rack::Validate::ResponseFile.new(@initialization_string)
  end
  
  it "should respond to the read method" do
    @response_file.respond_to?(:read).should be_true
  end
  
  it "should return the string it was initialized with from the read method" do
    @response_file.read.should == @initialization_string
  end
end