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

data = File.read_lines("inputs/day3.txt").map { |v| parse_claim(v) }
puts "Day 3 Part 1: #{find_duplicate_claims(data)}"
puts "Day 3 Part 2: #{find_nonoverlapping_claim(data).not_nil!.id}"

data = File.read_lines("inputs/day4.txt").sort.map { |v| parse_guard_log(v).not_nil! }
guard_minutes = process_guard_events(data)
puts "Day 4 Part 1: #{find_guard_part1(guard_minutes)}"
puts "Day 4 Part 2: #{find_guard_part2(guard_minutes)}"
