def find_twos_and_threes(id)
  occurrences = {} of Char => Int32
  num_twos = 0
  num_threes = 0
  id.each_char do |v|
    occurrences[v] = occurrences.fetch(v, 0) + 1
  end
  occurrences.each do |k, v|
    if v == 2
      num_twos = 1
    end
    if v == 3
      num_threes = 1
    end
  end
  return {num_twos, num_threes}
end

def strdiff(a, b)
  diff = 0
  a.chars.zip(b.chars) do |c, d|
    if c != d
      diff += 1
    end
  end
  return diff
end

def common_letters(a, b)
  return String.build do |str|
    a.chars.zip(b.chars) do |c, d|
      if c == d
        str << c
      end
    end
  end
end
