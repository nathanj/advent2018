require "./advent/*"
require "levenshtein"

data = File.read_lines("inputs/day1.txt").map &.to_i
puts "Day 1 Part 1: #{data.sum}"
puts "Day 1 Part 2: #{find_repeated_frequency(data)}"

data = File.read_lines("inputs/day2.txt")
dups = data.map { |v| find_twos_and_threes(v) }
twos = dups.count { |(a, b)| a == true }
threes = dups.count { |(a, b)| b == true }
puts "Day 2 Part 1: #{twos * threes}"
data.each_with_index do |a, i|
  data.each_with_index do |b, j|
    if i < j
      dist = strdiff(a, b)
      if dist == 1
        puts "Day 2 Part 2: #{common_letters(a, b)}"
      end
    end
  end
end
