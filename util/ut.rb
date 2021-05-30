# Unzip and move test cases from Downloads to oj test dir.

require 'fileutils'

pwd = Dir.pwd
FileUtils.mv('test', 'sample') if File.exist?('test')
Dir.mkdir('test')

Dir.chdir("#{Dir.home}/Downloads")
zip = Dir.glob('?.zip')[0]
`unzip #{zip} -x /`
File.delete(zip)

Dir.each_child('in') { |file| FileUtils.mv("in/#{file}", "#{pwd}/test/#{file}.in") }
Dir.rmdir('in')

Dir.each_child('out') { |file| FileUtils.mv("out/#{file}", "#{pwd}/test/#{file}.out") }
Dir.rmdir('out')

puts 'success'
