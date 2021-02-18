# uninstall gems except defaults

`gem list --no-versions`.split("\n").each do
  `gem uninstall #{_1} -aIx`
  puts "deleted: #{_1}"
end

puts 'success'
