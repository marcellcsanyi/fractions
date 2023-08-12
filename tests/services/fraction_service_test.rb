require_relative "../../app/services/fraction_service.rb"
require "test/unit"

class FractionServiceSpec < Test::Unit::TestCase

  def test_get_left_number
    assert_equal("1/2", FractionService.get_left_number(" 1/2  *  3&3/4 "))
  end

  def test_get_right_number
    assert_equal("3&3/4", FractionService.get_right_number(" 1/2 *   3&3/4"))
  end

  def test_get_operator
    assert_equal("*", FractionService.get_operator(" 1/2   * 3&3/4"))
  end

  CONVERT = [
    [Rational(3, 1), "3"],
    [Rational(3, 4), "3/4"],
    [Rational(7, 4), "1&3/4"],
  ]
  def test_convert_whole
    CONVERT.each do |expected, value|
      assert_equal(expected, FractionService.convert(value))
    end
  end

  CONVERT_BACK = [
    ["3", Rational(3, 1)],
    ["3/4", Rational(3, 4)],
    ["1&3/4", Rational(7, 4)],
  ]
  def test_convert_back
    CONVERT_BACK.each do |expected, rational|
      assert_equal(expected, FractionService.convert_back(rational))
    end
  end

  VALID_COMMANDS = [
    "1/2 * 3&3/4",
    "3&1/2 - -3&3/4",
    "3 / 3/4",
    "-3&1/2 + 3"
  ]
  def test_valid_command_valid
    VALID_COMMANDS.each do |valid_command|
      assert_equal(true, FractionService.valid_command?(valid_command))
    end
  end

  INVALID_COMMANDS = [
    "1/2 *",
    "1/2 * 3&3/4 =",
    "1/2 * 3//4",
    "1/ * 3/4",
    "1/2 ! 3&3/4"
  ]
  def test_valid_command_invalid
    INVALID_COMMANDS.each do |invalid_command|
      assert_equal(false, FractionService.valid_command?(invalid_command))
    end
  end

end
