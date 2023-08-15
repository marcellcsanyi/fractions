# frozen_string_literal: true

require 'test/unit'
require_relative '../../app/models/fraction'

# Tests for the Fraction class
class FractionTest < Test::Unit::TestCase
  EXPRESSIONS_FOR_INIT = [
    '3 + 2',
    '2&3/4          -           3'
  ].freeze
  def test_initialize
    EXPRESSIONS_FOR_INIT.each do |expression|
      fraction = Fraction.new(expression)
      assert_equal(3, fraction.expression.length)
    end
  end

  EXPRESSIONS_FOR_SOLVE = [
    ['3 + 2', Rational(5, 1)],
    ['2&3/4 - 3', Rational(-1, 4)],
    ['-1/4 * 3', Rational(-3, 4)],
    ['-1&1/2 * -2', Rational(3, 1)],
    ['3 / 1/2', Rational(6, 1)]
  ].freeze
  def test_solve
    EXPRESSIONS_FOR_SOLVE.each do |expression, expected|
      fraction = Fraction.new(expression)
      fraction.solve
      assert_equal(expected, fraction.result)
    end
  end
end
