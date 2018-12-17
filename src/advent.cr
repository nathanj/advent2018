require "./advent/*"

data = File.read_lines("inputs/day1.txt").map &.to_i
puts "Day 1 Part 1: #{data.sum}"
puts "      Part 2: #{find_repeated_frequency(data)}"

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
        puts "      Part 2: #{common_letters(a, b)}"
      end
    end
  end
end

data = File.read_lines("inputs/day3.txt").map { |v| parse_claim(v) }
puts "Day 3 Part 1: #{find_duplicate_claims(data)}"
puts "      Part 2: #{find_nonoverlapping_claim(data).not_nil!.id}"

data = File.read_lines("inputs/day4.txt").sort.map { |v| parse_guard_log(v).not_nil! }
guard_minutes = process_guard_events(data)
puts "Day 4 Part 1: #{find_guard_part1(guard_minutes)}"
puts "      Part 2: #{find_guard_part2(guard_minutes)}"

data = File.read("inputs/day5.txt").strip
puts "Day 5 Part 1: #{react_polymer(data).size}"
puts "      Part 2: #{react_polymer_improved(data).size}"

data = File.read_lines("inputs/day6.txt").map { |v| v.split(", ").map &.to_i }
puts "Day 6 Part 1: #{compute_area(data)}"
puts "      Part 2: #{compute_area_part2(data, 10000)}"

data = File.read_lines("inputs/day7.txt")
puts "Day 7 Part 1: #{compute_graph(data)}"
puts "      Part 2: #{compute_graph_part2(data)}"
