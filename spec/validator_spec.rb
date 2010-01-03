require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rack::Validate::Validator do

  it "should validate a simple response" do
    issues = Rack::Validate::Validator.validate('<html></html>')
    issues.should_not be_nil
  end
  
  it "should validate a really long response"
  
end