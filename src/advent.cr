require "./advent/*"

data = File.read("inputs/day1.txt").chomp.split('\n').map &.to_i
puts "Day 1 Part 1: #{data.sum}"
puts "Day 1 Part 2: #{find_repeated_frequency(data)}"
