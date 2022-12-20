require_relative "helpers/csv_manager.rb"
require_relative "helpers/parser_to_json.rb"

def parseWebPage()
    json_file_path = './cars.json'
    csv_file_path = './cars.csv'
    cars = ParserToJson.parse_html_by_url('https://auto.ria.com/uk/legkovie/mazda/3')
    ParserToJson.save_to_json(json_file_path, cars)
    CSVManager.save_to_csv(csv_file_path, cars)
end

parseWebPage()

