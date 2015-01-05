# encoding: UTF-8

require "csv_xlsx_converter/converter"

describe CsvXlsxConverter::CsvToXlsx do
  describe "#initialize" do
    it "csv file -> success" do
      CsvXlsxConverter::CsvToXlsx.new "foo.csv"
    end
    it "not csv file -> exception" do
      expect { CsvXlsxConverter::CsvToXlsx.new "foo.xlsx" }.to raise_error(ArgumentError)
    end
  end

  describe "#convert" do
    let(:converter) { CsvXlsxConverter::CsvToXlsx.new "foo.csv" }
    it "output is not xlsx -> exception" do
      expect { converter.convert "foo.txt" }.to raise_error(ArgumentError)
    end
  end
end


describe CsvXlsxConverter::XlsxToCsv do
  describe "#initialize" do
    it "xlsx file -> success" do
      CsvXlsxConverter::XlsxToCsv.new "foo.xlsx"
    end
    it "not xlsx file -> exception" do
      expect {CsvXlsxConverter::XlsxToCsv.new "foo.csv" }.to raise_error(ArgumentError)
    end
  end

  describe "#convert" do
    let(:converter) { CsvXlsxConverter::XlsxToCsv.new "foo.xlsx" }
    it "output is not csv -> exception" do
      expect { converter.convert "foo.txt" }.to raise_error(ArgumentError)
    end
  end
end
