#!/usr/bin/env ruby

def convert(value)
    splitted_value = value.strip.split("&")

    if splitted_value.length == 2
        splitted_value[0].to_f + splitted_value[1].to_r
    elsif splitted_value[0].include?("/")
        splitted_value[0].to_r
    else
        splitted_value[0].to_f
    end
end

def convert_back(value)
    float_value = value.to_f
    whole = float_value.to_i
    fraction = float_value < 0 ? (float_value % -1).to_r : (float_value % 1).to_r

    if float_value < -1
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

command = ""

while (command.downcase.strip != "exit") do
    print "? "
    command = gets

    splitted_command = command.split(" ").delete_if(&:empty?)

    if splitted_command.length == 3
        left = splitted_command[0].strip
        operator = splitted_command[1].strip
        right = splitted_command[2].strip

        puts "= " + convert_back(convert(left).send(operator, convert(right)))
    end
end