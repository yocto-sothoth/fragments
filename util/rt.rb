# ruby rt.rb test/sample-01.in
# => ./main.rb: xxx sec
# ruby rt.rb ./other.rb test/sample-01.in
# => ./other.rb: xxx sec

require 'benchmark'

if ARGV[1]
  ARGV[0], ARGV[1] = ARGV[1], ARGV[0]
  time = Benchmark.realtime { load(ARGV[1]) }
  puts format("#{ARGV[0]}: %.6f sec", time)

else
  time = Benchmark.realtime { load('./main.rb') }
  puts format('./main.rb: %.6f sec', time)
end
