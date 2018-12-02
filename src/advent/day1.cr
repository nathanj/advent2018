def find_repeated_frequency(input)
  freqs = [0].to_set
  current_freq = 0
  input.cycle do |i|
    current_freq += i
    if freqs.includes? current_freq
      return current_freq
    end
    freqs.add current_freq
  end
end
