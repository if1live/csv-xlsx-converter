# cvs-xlsx-converter

[![Build Status](https://travis-ci.org/if1live/csv-xlsx-converter.svg?branch=master)](https://travis-ci.org/if1live/csv-xlsx-converter)

Convert CSV to Excel xlsx, Excel xlsx to CSV.


## Install
```bash
gem install rubyXL
# or...
bundle install
```

## Usage

Command line script get one or two arguments.

1. First argument : Input filename (Required)
2. Second argument : Output filename (Optional)

If second argment is not predefined, use first filename as excel xlsx filename.
For example, input filename is foo.csv then output filename is foo.xlsx.


### CSV to Excel xlsx
```bash
csv_xlsx_converter.rb input.csv
csv_xlsx_converter.rb input.csv output.xlsx
```

### Excel xlsx to CSV
```bash
csv_xlsx_converter.rb input.xlsx
csv_xlsx_converter.rb input.xlsx output.csv
```
