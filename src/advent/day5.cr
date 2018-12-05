def react_polymer(str)
  stack = [] of Char
  a = str.chars
  a.each do |c|
    if stack.size > 0
      last = stack[stack.size - 1]
      if last != c && (last == c.upcase || last.upcase == c)
        stack.pop
      else
        stack.push c
      end
    else
      stack.push c
    end
  end
  return stack.join("")
end

def react_polymer_improved(str)
  results = {} of Char => String
  alpha = 'a'..'z'
  alpha.each do |c|
    results[c] = react_polymer(str.delete(c).delete(c.upcase))
  end
  return results.min_by { |k, v| v.size }[1]
end
