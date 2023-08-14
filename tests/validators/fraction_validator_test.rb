# frozen_string_literal: true

require 'test/unit'
require 'active_model'
require_relative '../../app/validators/fraction_validator'

# Mock class for the FractionValidator tests
class MockFraction
  include ActiveModel::Validations

  validates_with FractionValidator

  attr_accessor :expression

  def initialize(expression)
    @expression = expression.split(' ').delete_if(&:empty?)
  end
end

# Tests for the FractionValidator class
class FractionValidatorTest < Test::Unit::TestCase
  VALID_COMMANDS = [
    '1/2 * 3&3/4',
    '3&1/2 - -3&3/4',
    '3 / 3/4',
    '-3&1/2 + 3'
  ].freeze
  def test_valid_command_valid
    VALID_COMMANDS.each do |valid_command|
      fraction = MockFraction.new(valid_command)
      fraction.valid?
      assert_equal('', fraction.errors.full_messages.join(' '))
    end
  end

  INVALID_COMMANDS = [
    ['1/2 *', 'Expression has 2 elements instead of 3.'],
    ['1/2 + 3&3/4 =', 'Expression has 4 elements instead of 3.'],
    ['1/ - 3/4', "Expression the '1/' number is invalid."],
    ['1/2 / 3//4', "Expression the '3//4' number is invalid."],
    ['1/2 ! 3&3/4', "Expression the '!' operator is invalid."],
    ['1/ + 3//4', "Expression the '1/' number is invalid. Expression the '3//4' number is invalid."]
  ].freeze
  def test_valid_command_invalid
    INVALID_COMMANDS.each do |invalid_command, errors|
      fraction = MockFraction.new(invalid_command)
      fraction.valid?
      assert_equal(errors, fraction.errors.full_messages.join(' '))
    end
  end
end
