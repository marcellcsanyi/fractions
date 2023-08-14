# frozen_string_literal: true

require_relative 'models/fraction'

while command.downcase.strip != 'exit'
  print '? '
  command = gets

  break if command.downcase.strip == 'exit'

  fraction = Fraction.new(command)

  if fraction.valid?
    fraction.solve

    puts "= #{fraction.result.to_string}"
  else
    puts "! #{fraction.errors.full_messages.join(' ')}"
  end
end
