# double every second digit from right to left
# if the doubled number is greater than 9, subtract 9 from the doubled number
# sum all the digits
# if the sum is divisible by 10, the number is valid
class Luhn
  def self.valid?(input)
    return false if input.size < 2 || input.scan(/[^\d\s]/).any?

    digits = input.scan(/\d/).map(&:to_i)

    return false if digits.size < 2

    reversed_digits = digits.reverse

    # puts reversed_digits.inspect
    reversed_digits.each_with_index do |digit, i|
      if i.odd?
        doubled = digit * 2
        doubled -= 9 if doubled > 9
        reversed_digits[i] = doubled
      end
    end

     reversed_digits.sum % 10 == 0
  end
end
