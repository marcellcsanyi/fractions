# frozen_string_literal: true

require_relative 'models/fraction'

command = ''
while command.downcase.strip != 'exit'
  print '? '
  command = gets

  break if command.downcase.strip == 'exit'

  fraction = Fraction.new(command)

  if fraction.valid?
    begin
      fraction.solve

      puts "= #{fraction.result.to_string}"
    rescue StandardError => e
      puts "! #{e.message}"
    end
  else
    puts "! #{fraction.errors.full_messages.join(' ')}"
  end
end
