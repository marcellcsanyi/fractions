# frozen_string_literal: true

# Extension for the String class
class String
  def to_rational
    parts = split('&')

    if parts.length == 2
      convert_two_part_format(parts)
    else
      parts[0].to_r
    end
  end

  private

  def convert_two_part_format(parts)
    if parts[0].to_i.positive?
      parts[0].to_r + parts[1].to_r
    else
      parts[0].to_r - parts[1].to_r
    end
  end
end
