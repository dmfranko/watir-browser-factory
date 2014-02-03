require "watir/browser/factory/version"

module Watir
  module Browser
    module Factory
      def init
        Watir::Browser.new :chrome
      end
    end
  end
end
