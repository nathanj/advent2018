def react_polymer(str)
  stack = [] of Char
  str.each_char do |c|
    last = stack.size > 0 ? stack[stack.size - 1] : ' '
    if last != c && last.upcase == c.upcase
      stack.pop
    else
      stack.push c
    end
  end
  return stack.join("")
end

def react_polymer_improved(str)
  alpha = 'a'..'z'
  alpha.map { |c| react_polymer(str.delete(c).delete(c.upcase)) }
    .min_by { |v| v.size }
end
