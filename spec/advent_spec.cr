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

describe "Day3" do
  it "parses claims" do
    claim = parse_claim("#123 @ 3,2: 5x4")
    claim.id.should eq 123
    claim.rect.x.should eq 3
    claim.rect.y.should eq 2
    claim.rect.w.should eq 5
    claim.rect.h.should eq 4
  end

  it "finds claims" do
    find_duplicate_claims([Claim.new(1, Rect.new(1, 3, 4, 4)),
                           Claim.new(2, Rect.new(3, 1, 4, 4)),
                           Claim.new(3, Rect.new(5, 5, 2, 2))]).should eq 4
  end

  it "finds non-overlapping claim" do
    claim = find_nonoverlapping_claim([Claim.new(1, Rect.new(1, 3, 4, 4)),
                                       Claim.new(2, Rect.new(3, 1, 4, 4)),
                                       Claim.new(3, Rect.new(5, 5, 2, 2))])
    claim.not_nil!.id.should eq 3
  end
end
