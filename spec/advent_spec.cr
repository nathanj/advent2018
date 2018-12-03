require "./spec_helper"

describe "Day1" do
  it "finds repeated frequencies" do
    find_repeated_frequency([+1, -1]).should eq 0
    find_repeated_frequency([+3, +3, +4, -2, -4]).should eq 10
    find_repeated_frequency([-6, +3, +8, +5, -6]).should eq 5
    find_repeated_frequency([+7, +7, -2, -7, -4]).should eq 14
  end
end

describe "Day2" do
  it "finds twos and threes" do
    find_twos_and_threes("abcdef").should eq({false, false})
    find_twos_and_threes("bababc").should eq({true, true})
    find_twos_and_threes("abbcde").should eq({true, false})
    find_twos_and_threes("abcccd").should eq({false, true})
    find_twos_and_threes("aabcdd").should eq({true, false})
    find_twos_and_threes("abcdee").should eq({true, false})
    find_twos_and_threes("ababab").should eq({false, true})
  end

  it "calculates strdiff" do
    strdiff("abcde", "axcye").should eq 2
    strdiff("fghij", "fguij").should eq 1
  end

  it "finds common letters" do
    common_letters("fghij", "fguij").should eq "fgij"
  end
end
