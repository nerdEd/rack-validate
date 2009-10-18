require 'rubygems'
require 'rack'
require 'w3c_validators'

module Rack
  class Validate
    class Validator
      include W3CValidators
      
      def self.validate( response )
        validator = MarkupValidator.new    
        validator.validate_text( response )        
      end
      
      def self.generate_report( issues )        
        report = ""
        report << STYLES
        
        report << "<div id='message_toolbar'>"
        
        report << generate_error_table( issues.errors ) unless issues.errors.empty?
        report << generate_error_table( issues.warnings ) unless issues.warnings.empty?
        
        report << "</div>"
      end
      
      private 
      
        def self.generate_error_table( list )
          if list
            table = ""
            table << "<table class='issue_table'>"
            table << "<tr><th>Line #</th><th>Error</th></tr>"
            list.each do |item|
              table << "<tr><td class='line_number_column'>#{item.line}</td><td class='error_message_column'>#{html_escape( item.message )}</td></tr>"
            end
            table << "</table>"
          end
        end
      
        # Stealing HTML escape method from rails
        def self.html_escape( string )
          string.to_s.gsub(/[&"><]/) { |special| HTML_ESCAPE[special] }
        end
      
        # Stealing HTML escape constant from rails
        HTML_ESCAPE	=	{ '&' => '&amp;', '>' => '&gt;', '<' => '&lt;', '"' => '&quot;' }
      
        STYLES = <<-HERE
          <style type='text/css'>
            #message_toolbar {
              width: 100%; 
              height: auto;
              background: black;
              position: absolute;
              top:0;
              left:0;
              text-align:center;
              -moz-opacity:.60; 
              filter:alpha(opacity=60); 
              opacity:.60;
              font-size: 24pt;
            }
          
            .issue_table {
              margin: 0 auto;
              border: none;
              color: white;
            }
          
            .line_number_column {
              text-align: center;
            }
          
            .error_message_column {
              text-align: left;
            }
          
            .header_row {
            
            }
          
            .on_row {
            
            }
          
            .off_row {
            
            }
          </style>
        HERE
    end
  end  
end