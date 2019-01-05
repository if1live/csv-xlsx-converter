# encoding: UTF-8

require "csv"
require "rubyXL"

module CsvXlsxConverter
  class CsvToXlsx
    def initialize(input_file)
      raise ArgumentError, "input file is not csv" unless CsvXlsxConverter::csv_filename? input_file
      @input_file = input_file
      @worksheet_idx = 0
    end

    def convert(output_file)
      raise ArgumentError, "output file is not xlsx" unless CsvXlsxConverter::xlsx_filename? output_file

      workbook = RubyXL::Workbook.new
      worksheet = workbook[0]

      options = {:encoding => 'bom|UTF-8', :skip_blanks => true}
      CSV.foreach(@input_file, options).each_with_index do |row, row_idx|
        # http://stackoverflow.com/questions/12407035/ruby-csv-get-current-line-row-number
        row.each_with_index do |item, index|
          worksheet.add_cell row_idx, index, item
        end
      end

      workbook.write output_file
    end
  end

  class XlsxToCsv
    def initialize(*args)
      worksheet_idx = '0'
      if args.count == 2
        input_file = args[0]
        worksheet_idx = args[1]
      elsif args.count == 1
        input_file = args[0]
      else
        raise ArgumentError, "must supply at least one or two arguments (input_file, worksheet_idx)"
      end
      raise ArgumentError, "input file is not xlsx" unless CsvXlsxConverter::xlsx_filename? input_file
      @input_file = input_file
      @worksheet_idx = worksheet_idx.to_i
    end

    def convert(output_file)
      raise ArgumentError, "output file is not csv" unless CsvXlsxConverter::csv_filename? output_file

      CSV.open(output_file, "wb") do |csv|
        workbook = RubyXL::Parser.parse @input_file
        worksheet = workbook[@worksheet_idx]
        worksheet.each_with_index do |row, row_idx|
          row_data = []
          (0...row.size).each do |col_idx|
            begin
              cell = row[col_idx]
              val = cell.value
              row_data << val
            rescue NoMethodError
              row_data << ""
            end
          end
          csv << row_data
        end
      end
    end
  end
end
