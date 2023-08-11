require_relative "../../app/services/fraction_service.rb"
require "test/unit"

class FractionServiceSpec < Test::Unit::TestCase

  def test_get_left_number
    assert_equal("1/2", FractionService.get_left_number("1/2 * 3&3/4"))
  end

  def test_get_right_number
    assert_equal("3&3/4", FractionService.get_right_number(" 1/2 * 3&3/4 "))
  end

  def test_get_operator
    assert_equal("*", FractionService.get_operator("1/2   *   3&3/4"))
  end

  def test_convert_whole
    assert_equal(Rational(3, 1), FractionService.convert("3"))
  end

  def test_convert_fraction
    assert_equal(Rational(3, 4), FractionService.convert("3/4"))
  end

  def test_convert_mixed
    assert_equal(Rational(7, 4), FractionService.convert("1&3/4"))
  end

  def test_convert_back_whole
    assert_equal("3", FractionService.convert_back(Rational(3, 1)))
  end

  def test_convert_back_fraction
    assert_equal("3/4", FractionService.convert_back(Rational(3, 4)))
  end

  def test_convert_back_mixed
    assert_equal("1&3/4", FractionService.convert_back(Rational(7, 4)))
  end

  def test_valid_command_valid
    assert_equal(true, FractionService.valid_command?("1/2 * 3&3/4"))
  end

  def test_valid_command_with_less_values
    assert_equal(false, FractionService.valid_command?("1/2 *"))
  end

  def test_valid_command_with_more_values
    assert_equal(false, FractionService.valid_command?("1/2 * 3&3/4 ="))
  end

  def test_valid_command_with_invalid_number
    assert_equal(false, FractionService.valid_command?("1/2 * test"))
  end

  def test_valid_command_with_invalid_operator
    assert_equal(false, FractionService.valid_command?("1/2 ! 3&3/4"))
  end

end
