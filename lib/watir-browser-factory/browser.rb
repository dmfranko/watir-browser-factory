module Watir
  class Browser
    class << self
      #
      # Creates a Watir::Browser instance and goes to URL.
      #
      # @example
      #   browser = Watir::Browser.start "www.google.com", :chrome
      #   #=> #<Watir::Browser:0x..fa45a499cb41e1752 url="http://www.google.com" title="Google">
      #
      # @param [String] url
      # @param [Symbol, Selenium::WebDriver] browser :firefox, :ie, :chrome, :remote or Selenium::WebDriver instance
      # @return [Watir::Browser]
      #
      def start(url, browser = :firefox, *args)
        b = new(browser, *args)
        b.goto url

        b
      end

      def smart_start(url,caps,*args)
        # If we didn't get a platform we're assuming that we're running locally.
        # Don't like how long service status takes now.

        if caps[:platform] # && SauceWhisk::Sauce.service_status[:service_operational]
          b = Watir::Browser.new(*args,:remote,
          :url => "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub",
          :desired_capabilities => caps)
        else
          puts "Running locally"
          b = Watir::Browser.new(:firefox)
        end
        
        b.goto url

        # Return our browser.
        b
      end
    end
  end # Browser
end # Watir