class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i if numbers.size == 1

    delimiter = ","
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..-1])
      numbers = parts[1]
    end

    number_list = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    negatives = number_list.select { |num| num < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    number_list.reduce(:+)
  end
end
