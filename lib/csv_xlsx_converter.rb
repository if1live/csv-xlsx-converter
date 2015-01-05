#!/usr/bin/env ruby
# encoding: UTF-8

require_relative "csv_xlsx_converter/filename"
require_relative "csv_xlsx_converter/converter"
require_relative "csv_xlsx_converter/cli"


if __FILE__ == $0
  CsvXlsxConverter::main
end
