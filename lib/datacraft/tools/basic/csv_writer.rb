module Datacraft::Tools::Basic
  # CSV file writer
  class CsvWriter
    def initialize(csv_file)
      @csv = CSV.open(csv_file, headers: true, header_converters: :symbol)
    end

    def <<(row)
    end
  end
end
