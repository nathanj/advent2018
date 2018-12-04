require "../spec_helper"

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
