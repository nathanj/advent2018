def find_twos_and_threes(id)
  occurrences = {} of Char => Int32
  id.each_char do |v|
    occurrences[v] = occurrences.fetch(v, 0) + 1
  end
  twos = !occurrences.find { |k, v| v == 2 }.nil?
  threes = !occurrences.find { |k, v| v == 3}.nil?
  return {twos, threes}
end

def strdiff(a, b)
  return a.chars.zip(b.chars)
    .count { |(c, d)| c != d }
end

def common_letters(a, b)
  return a.chars.zip(b.chars)
    .select { |(c, d)| c == d }
    .map { |(c, d)| c }
    .join("")
end
