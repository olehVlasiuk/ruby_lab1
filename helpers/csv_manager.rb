require "csv"

module CSVManager

    def CSVManager.save_to_csv(path_to_csv, array)
        CSV.open(path_to_csv, "w+", headers: array[0].keys, write_headers: true) do |csv_file|
            array.each do |element|
                csv_file << element.values
            end
        end
    end

end
