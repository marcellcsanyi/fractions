# frozen_string_literal: true

require 'active_model'
require_relative '../validators/fraction_validator'
require_relative '../extensions/string_extension'
require_relative '../extensions/rational_extension'

# Class for maintaining the fractions
class Fraction
  include ActiveModel::Validations

  validates_with FractionValidator

  attr_accessor :expression, :result

  def initialize(expression)
    @expression = expression.split(' ').delete_if(&:empty?)
  end

  def solve
    left = @expression[0].to_rational
    operator = @expression[1]
    right = @expression[2].to_rational

    @result = left.send(operator, right)
  end
end
