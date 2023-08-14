# frozen_string_literal: true

require 'test/unit'
require_relative '../../app/extensions/rational_extension'

# Tests for the RationalExtension class
class RationalExtensionTest < Test::Unit::TestCase
  CONVERT = [
    ['3', Rational(3, 1)],
    ['3/4', Rational(3, 4)],
    ['1&3/4', Rational(7, 4)]
  ].freeze
  def test_to_string
    CONVERT.each do |expected, value|
      assert_equal(expected, value.to_string)
    end
  end
end
