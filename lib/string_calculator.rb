class StringCalculator

  def add(numbers)
    return 0 if numbers.nil? || numbers.empty? 

    delimiter, numbers = get_delimiter_and_numbers(numbers)
    delimiters_regex = Regexp.union([delimiter, ",", "\n"].compact)
    number_array = numbers.split(delimiters_regex).map(&:to_i)

    negative_number = number_array.select { |num| num < 0 }
    raise "negative numbers not allowed: #{negative_number.join(', ')}" unless negative_number.empty?

    number_array.sum
  end

  private

  def get_delimiter_and_numbers(numbers)
    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      return [Regexp.escape(delimiter), numbers]
    end
    [nil, numbers]
  end
end
