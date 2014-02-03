module Watir
  class Browser
    super
    def initialize(browser = :firefox, *args)
      puts "My version"
      case browser
      when Symbol, String
        @driver = Selenium::WebDriver.for browser.to_sym, *args
      when Selenium::WebDriver::Driver
        @driver = browser
      else
      raise ArgumentError, "expected Symbol or Selenium::WebDriver::Driver, got #{browser.class}"
      end

      @error_checkers = []
      @current_frame  = nil
      @closed         = false
    end
  end # Browser
end # Watir