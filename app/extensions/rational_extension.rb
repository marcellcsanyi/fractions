# frozen_string_literal: true

# Extension of the Rational class
class Rational
  def to_string
    whole = to_i
    fraction = negative? ? (self % -1).to_r : (self % 1).to_r

    fraction *= -1 if self < -1

    if fraction.zero?
      whole.to_s
    elsif whole.zero?
      fraction.to_s
    else
      "#{whole}&#{fraction}"
    end
  end
end
