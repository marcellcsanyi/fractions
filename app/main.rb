#!/usr/bin/env ruby
require_relative "services/fraction_service.rb"

command = ""

while (command.downcase.strip != "exit") do
    print "? "
    command = gets

    if FractionService.valid_command?(command)
        left = FractionService.convert(FractionService.get_left_number(command))
        right = FractionService.convert(FractionService.get_right_number(command))
        operator = FractionService.get_operator(command)

        result = left.send(operator, right)

        puts "= " + FractionService.convert_back(result)
    elsif command.downcase.strip != "exit"
        puts "Format error whole&numerator/denominator operator whole&numerator/denominator"
    end
end
