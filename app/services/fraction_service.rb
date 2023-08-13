class FractionService

  OPERATOR_REGEX = Regexp.new("^[\-\*\+\/]$")
  MIXED_REGEX = Regexp.new("^-?[0-9]+&[0-9]+\/[0-9]+$")
  WHOLE_REGEX = Regexp.new("^-?[0-9]+$")
  FRACTION_REGEX = Regexp.new("^-?[0-9]+\/[0-9]+$")
  

  def self.convert(value)
    splitted_value = value.split("&")
  
    if splitted_value.length == 2
      if splitted_value[0].to_i > 0
        splitted_value[0].to_r + splitted_value[1].to_r
      else
        splitted_value[0].to_r - splitted_value[1].to_r
      end
    elsif splitted_value[0].include?("/")
      splitted_value[0].to_r
    else
      splitted_value[0].to_r
    end
  end
  
  def self.convert_back(value)
    whole = value.to_i
    fraction = value < 0 ? (value % -1).to_r : (value % 1).to_r
  
    if value < -1
      fraction *= -1
    end
  
    if fraction == 0
      whole.to_s
    elsif whole == 0
      fraction.to_s
    else
      "#{whole.to_s}&#{fraction.to_s}"
    end
  end

  def self.validate_command(command)
    splitted_command = command.split(" ").delete_if(&:empty?)
    errors = []

    if splitted_command.length != 3
      errors.push("The command has #{splitted_command.length} elements instead of 3.")
    else
      if !valid_number(splitted_command[0])
        errors.push("The '#{splitted_command[0]}' number is invalid.")
      end
      if !OPERATOR_REGEX.match?(splitted_command[1])
        errors.push("The '#{splitted_command[1]}' operator is invalid.")
      end
      if !valid_number(splitted_command[2])
        errors.push("The '#{splitted_command[2]}' number is invalid.")
      end
    end
    
    errors
  end

  def self.get_left_number(command)
    splitted_command = command.split(" ").delete_if(&:empty?)
    splitted_command[0]
  end

  def self.get_operator(command)
    splitted_command = command.split(" ").delete_if(&:empty?)
    splitted_command[1]
  end

  def self.get_right_number(command)
    splitted_command = command.split(" ").delete_if(&:empty?)
    splitted_command[2]
  end

  private

  def self.valid_number(value)
    MIXED_REGEX.match?(value) ||
    WHOLE_REGEX.match?(value) ||
    FRACTION_REGEX.match?(value)
  end

end
