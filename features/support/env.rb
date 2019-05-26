require 'capybara'
require 'capybara/cucumber'
require "selenium-webdriver"

@browser = ENV['BROWSER']

Capybara.configure do |config|
    if @browser.eql?('firefox')
        config.default_driver = :selenium
    elsif @browser.eql?('chrome')
        config.default_driver = :selenium_chrome
    elsif @browser.eql?("headless-chrome")
        Capybara.register_driver :selenium do |app|
            arguments = ["headless","disable-gpu", "no-sandbox", "window-size=1920,1080", "privileged"]
            preferences = {
                'download.default_directory': File.expand_path(File.join(File.dirname(__FILE__), "../../downloads/")),
                'download.prompt_for_download': false,
                'plugins.plugins_disabled': ["Chrome PDF Viewer"],
            }
            options = Selenium::WebDriver::Chrome::Options.new(args: arguments, prefs: preferences)
            Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
        end
        Capybara.default_driver = :selenium
    else
        config.default_driver = :selenium
    end
    # config.app_host = 'http://localhost:3000'
end

Capybara.run_server = false
Capybara.default_max_wait_time = 30