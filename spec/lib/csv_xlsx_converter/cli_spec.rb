# encoding: utf-8

require 'tempfile'
require "csv_xlsx_converter/cli"
require "csv_xlsx_converter/converter"


def get_data_file filename
  root_path = __FILE__
  4.times { root_path = File.dirname(root_path) }
  File.join(root_path, 'data', filename)
end


describe CsvXlsxConverter do
  describe ".main" do
    before(:each) do
      temp = Tempfile.new(["temp", ".xlsx"])
      @temp_file = temp.path
      temp.unlink
    end

    before(:each) do
      output = Tempfile.new(["output", ".csv"])
      @output_file = output.path
      output.unlink
    end

    it "csv -> xlsx -> csv" do
      input_file = get_data_file "sample-1.csv"

      csv_xlsx = CsvXlsxConverter::CsvToXlsx.new input_file
      csv_xlsx.convert @temp_file

      xlsx_csv = CsvXlsxConverter::XlsxToCsv.new @temp_file
      xlsx_csv.convert @output_file

      expect(true).to eq(FileUtils.compare_file input_file, @output_file)
    end

    after(:each) do
      File.delete(@temp_file)
      File.delete(@output_file)
    end
  end
end
