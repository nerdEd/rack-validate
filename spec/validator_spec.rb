require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Rack::Validate::Validator do

  # Note: Both of these tests require an internet connection to run...
  # not sure how to properly mock out the validator without making them pointless.
  it "should validate a simple response" do
    issues = Rack::Validate::Validator.validate('<html></html>')
    issues.should_not be_nil
  end
  
  it "should validate a really long response" do
    File.open(File.expand_path(File.dirname(__FILE__) + '/fixtures/long_response.html')) do |f|
      issues = Rack::Validate::Validator.validate(f.read)
    end
  end
  
end