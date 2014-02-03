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

      def smart_start(url, browser = :firefox, *args)
        if ! ENV["LOCAL"]
          #if ! ENV["LOCAL"] && SauceWhisk::Sauce.service_status[:service_operational]
          b = Watir::Browser.new(:remote,:url => "http://dfranko:6ca5782d-8b84-4380-bff5-966c21b18f92@ondemand.saucelabs.com:80/wd/hub",
          :desired_capabilities =>
          {
            :browserName => :chrome,
            :platform => "Linux",
            :version => "30",
            :name => "This be the name."
          })
        else
          puts "Running locally"
          b = Watir::Browser.new(:firefox)
        end
          b.goto url
          
          b
      end
    end
  end # Browser
end # Watir