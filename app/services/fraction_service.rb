class FractionService

    OPERATOR_REGEX = Regexp.new("[\*,\-,+,\/]")
    MIXED_REGEX = Regexp.new("[0-9]+&[0-9]+\/[0-9]+")
    WHOLE_REGEX = Regexp.new("[0-9]+")
    FRACTION_REGEX = Regexp.new("[0-9]+\/[0-9]+")
    

    def self.convert(value)
        splitted_value = value.split("&")
    
        if splitted_value.length == 2
            splitted_value[0].to_r + splitted_value[1].to_r
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
            whole.to_s + "&" + fraction.to_s
        end
    end

    def self.valid_command?(command)
        splitted_command = command.split(" ").delete_if(&:empty?)

        splitted_command.length == 3 &&
        OPERATOR_REGEX.match?(splitted_command[1].strip) &&
        valid_number(splitted_command[0].strip) &&
        valid_number(splitted_command[2].strip)
    end

    def self.get_left_number(command)
        splitted_command = command.split(" ").delete_if(&:empty?)
        splitted_command[0].strip
    end

    def self.get_operator(command)
        splitted_command = command.split(" ").delete_if(&:empty?)
        splitted_command[1].strip
    end

    def self.get_right_number(command)
        splitted_command = command.split(" ").delete_if(&:empty?)
        splitted_command[2].strip
    end

    private

    def self.valid_number(value)
        MIXED_REGEX.match?(value) ||
        WHOLE_REGEX.match?(value) ||
        FRACTION_REGEX.match?(value)
    end
end
