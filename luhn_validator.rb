# frozen_string_literal: true

# Description: Validates credit card number using Luhn Algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # TODO: use the integers in nums_a to validate its last check digit
    last_digit = nums_a.pop
    new_nums = nums_a.reverse.map.with_index { |n, i| luhn_multiplier(n, i) }
    check_digit = (10 - new_nums.sum % 10) % 10
    check_digit == last_digit
  end

  def luhn_multiplier(number, index)
    if index.even?
      number * 2 > 9 ? (number * 2) - 9 : number * 2
    else
      number
    end
  end
end
