def add(string)
  default_scanner = /;|\\n|\s/

  guess_delimiter = string.match(/^\/\/(.)\n/)&.captures&.first

  delimiter_regex = guess_delimiter || default_scanner

  string = string.strip.gsub(delimiter_regex, ',')

  # get numbers
  numbers = string.split(',').map(&:to_i)

  # raise expection if negative number is present
  negative_numbers = numbers.select { |n| n < 0 }
  raise StandardError.new "Negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?

  # return sum
  numbers.sum
end