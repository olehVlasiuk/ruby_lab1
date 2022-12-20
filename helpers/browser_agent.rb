require 'rubygems'
require 'mechanize'

class BrowserAgent

    def initialize()
        @browser_agent = Mechanize.new { |agent|
            agent.user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36'
        }
    end

    def open_url(url)
        @latest_opened_page = @browser_agent.get(url)
        @main_page = url
    end
    
end
