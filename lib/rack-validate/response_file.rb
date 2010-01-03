module Rack
  class Validate
    class ResponseFile
      
      def initialize(string)
        @string = string
      end
      
      def read
        @string
      end
    end
  end
end