require_relative "services/fraction_service.rb"

command = ""

while (command.downcase.strip != "exit") do
  print "? "
  command = gets
  errors = FractionService.validate_command(command)

  if errors.empty?
    left = FractionService.convert(FractionService.get_left_number(command))
    right = FractionService.convert(FractionService.get_right_number(command))
    operator = FractionService.get_operator(command)

    result = left.send(operator, right)

    puts "= #{FractionService.convert_back(result)}"
  elsif command.downcase.strip != "exit"
    puts "! #{errors.join(" ")}"
  end
end
