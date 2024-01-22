#!/usr/bin/ruby

# begin
#   file = open("/unexistant_file")
#   if file
#     puts "Файл успешно открыт "
#   end
# rescue
#   file = STDIN
# end
#
# print file, "==", STDIN, "\n"
begin
  raise 'Тестовое исключение.'
rescue Exception => e
  puts e.message
  puts e.backtrace.inspect
end
