# frozen_string_literal: true

# Validator for the Fraction class
class FractionValidator < ActiveModel::Validator
  OPERATOR_REGEX = Regexp.new('^[\-\*\+\/]$')
  MIXED_REGEX = Regexp.new('^-?[0-9]+&[0-9]+\/[0-9]+$')
  WHOLE_REGEX = Regexp.new('^-?[0-9]+$')
  FRACTION_REGEX = Regexp.new('^-?[0-9]+\/[0-9]+$')

  def validate(record)
    if record.expression.length != 3
      record.errors.add :expression, "has #{record.expression.length} elements instead of 3."
    else
      validate_number(record.expression[0], record, :expression)
      validate_operator(record.expression[1], record, :expression)
      validate_number(record.expression[2], record, :expression)
    end
  end

  private

  def validate_operator(value, record, attr)
    return if OPERATOR_REGEX.match?(value)

    record.errors.add attr, "the '#{value}' operator is invalid."
  end

  def validate_number(value, record, attr)
    return if MIXED_REGEX.match?(value) || WHOLE_REGEX.match?(value) || FRACTION_REGEX.match?(value)

    record.errors.add attr, "the '#{value}' number is invalid."
  end
end
