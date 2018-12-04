require "../spec_helper"

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
