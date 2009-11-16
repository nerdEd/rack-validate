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
        report << SCRIPT
        
        report << "<div id='message_toolbar'>"
          report << '<div id="controls">'        
            summary = "<span>There were " + issues.errors.size.to_s + " errors and " + issues.warnings.size.to_s + " warnings</span><br/><br/>"
      		  report << summary  		  
      		  report << LINKS  		  
    		  report << '</div>'
        
          if !issues.errors.empty?
            report << "<table id='errors_table' style='display:none;'>"
            report << "<tr><td colspan='2' class='header_column'>Errors</td></tr>"
            issues.errors.each do |item|
              report << "<tr><td class='line_number_column'>Line #{item.line}</td><td class='message_column'>#{html_escape( item.message )}</td></tr>"
            end
            report << "</table>"
          end
        
          if !issues.warnings.empty?
            report << "<table id='warnings_table' style='display:none;'>"
            report << "<tr><td colspan='2' class='header_column'>Warnings</td></tr>"
            issues.warnings.each do |item|
              report << "<tr><td class='line_number_column'>--</td><td class='message_column'>#{html_escape( item.message )}</td></tr>"
            end
            report << "</table>"
          end
        report << "</div>"
      end
      
      private 
      
        # Stealing HTML escape method from rails
        def self.html_escape( string )
          string.to_s.gsub(/[&"><]/) { |special| HTML_ESCAPE[special] }
        end
      
        # Stealing HTML escape constant from rails
        HTML_ESCAPE	=	{ '&' => '&amp;', '>' => '&gt;', '<' => '&lt;', '"' => '&quot;' }
        
        LINKS = <<-HERE
  		    <a href="#" onclick="$( '#errors_table' ).toggle();updateText( this, 'Show Errors', 'Hide Errors' );">Show Errors</a>
  		    <a href="#" onclick="$( '#warnings_table' ).toggle();updateText( this, 'Show Warnings', 'Hide Warnings' );">Show Warnings</a>
  		    <a href="#" onclick="$( '#message_toolbar' ).toggle();">Close Toolbar</a>
  		  HERE
        
        SCRIPT = <<-HERE
          <script src="http://www.google.com/jsapi"></script>
          <script type="text/javascript">
            google.load("jquery", "1.3.2");
            google.load("jqueryui", "1.7.2");

            function updateText( element, textOne, textTwo ) {
              if( element.innerHTML == textOne ) {
                element.innerHTML = textTwo;
              }
              else { 
                element.innerHTML = textOne;
              }
            }
          </script>        
        HERE
                        
        STYLES = <<-HERE
    		<style type='text/css'>
          #message_toolbar {
            width: 100%; 
            min-height: 50px;
            background: black;
            position: absolute;			  
            top:0;
            left:0;
            -moz-opacity:.80; 
            filter:alpha(opacity=80); 
            opacity:.80;
            font-size: smaller;
            font-family: "Courier New";
            color: white;
            text-align: center;
          }			
          #message_toolbar a{
            color: white;
            font-weight: bold;
          }
          .line_number_column {
            text-align: left;
            width: 100px;
          }			
          .error_message_column {
            text-align: left;
          }		
          #errors_table,
          #warnings_table {
            width: 75%;
            margin: 0 auto;
            border: none;
            color: white;
            margin-top: 10px;
          }
          #errors_table .header_column,
          #warnings_table .header_column {
            text-align: center;
            border-bottom: 2px dashed;
          }
          #errors_table .header_column {
            border-color: red;
          }
          #warnings_table .header_column {
            border-color: yellow;
          }
    		</style>

        HERE
    end
  end  
end