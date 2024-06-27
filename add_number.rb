def add(string)
  # replace ; \n and space from input string with ,
  string = string.strip.gsub(/;|\\n|\s/, ',')

  # get numbers
  numbers = string.split(',').map(&:to_i)

  # raise expection if negative number is present
  negative_numbers = numbers.select { |n| n < 0 }
  raise StandardError.new "Negative numbers not allowed #{negative_numbers.join(',')}" if negative_numbers.any?

  # return sum
  numbers.sum
end