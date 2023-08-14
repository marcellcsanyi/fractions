# frozen_string_literal: true

require 'test/unit'
require_relative '../../app/extensions/string_extension'

# Tests for the StringExtension class
class StringExtensionTest < Test::Unit::TestCase
  CONVERT = [
    [Rational(3, 1), '3'],
    [Rational(3, 4), '3/4'],
    [Rational(7, 4), '1&3/4']
  ].freeze
  def test_to_string
    CONVERT.each do |expected, value|
      assert_equal(expected, value.to_rational)
    end
  end
end
