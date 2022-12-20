require 'date'
require 'open-uri'
require 'nokogiri'
require 'json'
require_relative "../helpers/browser_agent.rb"

module ParserToJson

    def ParserToJson.parse_html_by_url(web_site_url)
    	agent = BrowserAgent.new
    	agent.open_url(web_site_url)
        html = URI.open(web_site_url.to_s)
        html_document = Nokogiri::HTML(html)
        cars_items = []

        html_document.css('.ticket-item').each do |car_card|
			begin
				title = car_card.css('.address').text
				link = car_card.css('.address')[0]['href']
				kilometrage = car_card.css('.js-race').text
				price = car_card.css('.price-ticket')[0]['data-main-price']
				location = car_card.css('.view-location')[0].text.split.first
				currency = car_card.css('.price-ticket')[0]['data-main-currency']
	
				rescue ErrorHandler => e
					puts e
				end
		
				cars_items.push(
					title:title,
					price:price,
					currency:currency,
					location:location,
					kilometrage:kilometrage,
				link:link)
		
			end
		
		cars_items
	end

    def ParserToJson.make_pretty_json(cars_hash)
        JSON.pretty_generate(cars_hash)
    end

    def ParserToJson.save_to_json(file_path, jobs_hash)
        pretty_json = ParserToJson.make_pretty_json(jobs_hash)
        File.open(file_path, "w+") do |json_file|
            json_file.write(pretty_json)
         end
    end

end
