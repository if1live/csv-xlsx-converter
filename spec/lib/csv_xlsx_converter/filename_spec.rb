# encoding: UTF-8
require "csv_xlsx_converter/filename"

describe CsvXlsxConverter do
  describe ".csv_filename?" do
    it "csv file" do
      expect(true).to eq(CsvXlsxConverter::csv_filename? "foo.csv")
      expect(true).to eq(CsvXlsxConverter::csv_filename? "foo.CSV")
    end
    it "not csv file" do
      expect(false).to eq(CsvXlsxConverter::csv_filename? "foo.xlsx")
    end
  end

  describe ".xlsx_filename?" do
    it "xlsx file" do
      expect(true).to eq(CsvXlsxConverter::xlsx_filename? "foo.xlsx")
      expect(true).to eq(CsvXlsxConverter::xlsx_filename? "foo.XLSX")
    end
    it "not xlsx file" do
      expect(false).to eq(CsvXlsxConverter::xlsx_filename? "foo.csv")
    end
  end

  describe ".to_xlsx_filename" do
    it "csv to xlsx" do
      expect("foo.xlsx").to eq(CsvXlsxConverter::to_xlsx_filename "foo.csv")
      expect("foo.xlsx").to eq(CsvXlsxConverter::to_xlsx_filename "foo.CSV")
    end
  end

  describe ".to_csv_filename" do
    it "xlsx to csv" do
      expect("foo.csv").to eq(CsvXlsxConverter::to_csv_filename "foo.xlsx")
      expect("foo.csv").to eq(CsvXlsxConverter::to_csv_filename "foo.XLSX")
    end
  end
end
