require 'csv'

module Datacraft::Tools::Basic
  # CSV file reader
  class CsvReader
    def initialize(csv_file)
      @csv = CSV.open(csv_file, headers: true, header_converters: :symbol)
    end

    def each
      @csv.each do |row|
        yield(row.to_hash)
      end
      @csv.close
    end
  end
end
