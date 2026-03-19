class SimpleCalculator
  ALLOWED_OPERATIONS = ["+", "/", "*"].freeze
  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    first_operand.public_send(operation, second_operand).then do |result|
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    end
  rescue ZeroDivisionError
    "Division by zero is not allowed."
  rescue TypeError
    raise ArgumentError
  end
end