# encoding: UTF-8


module CsvXlsxConverter
  RE_CSV_EXTENSION = Regexp.new("\.csv$", Regexp::IGNORECASE)
  RE_XLSX_EXTENSION = Regexp.new("\.xlsx$", Regexp::IGNORECASE)

  def self.csv_filename? filename
    filename =~ RE_CSV_EXTENSION ? true : false
  end

  def self.xlsx_filename? filename
    filename =~ RE_XLSX_EXTENSION ? true : false
  end

  def self.to_xlsx_filename csv_filename
    csv_filename.gsub RE_CSV_EXTENSION, ".xlsx"
  end

  def self.to_csv_filename xlsx_filename
    xlsx_filename.gsub RE_XLSX_EXTENSION, ".csv"
  end
end
