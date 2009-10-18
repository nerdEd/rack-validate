require 'rack-validate/validator'

module Rack
  
  # A rack middleware for validating HTML via w3c validator
  class Validate
    
    def initialize( app )
      @app = app
    end
        
    def call( env )
      status, headers, response = @app.call( env )
      
      request = Rack::Request.new( env )
      if !request.params['rack-validate'].blank?
        if headers['Content-Type'] =~ /text\/html|application\/xhtml\+xml/
          body = response.body
        
          issues = Validator.validate( body )
        
          # I'd like to insert this right after the start of the body tag, but
          # because this is a validator I shouldn't assume that tag is there. 
          # If it's not, all the more reason we should be showing validation
          # errors. So, for now, we will just toss the report in at the start.
          body.insert( 0, Validator.generate_report( issues ) )
        
          headers["Content-Length"] = body.length.to_s
          response = [body]
        end
      end
      
      [status, headers, response]
    end
          
  end
end