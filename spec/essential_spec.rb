require_relative '../knife.rb'

describe "Knife Essentials spec" do

  it "should add I plus I => II" do
    expect(Knife.add("I", "I")).to eq("II")
  end

  it "should add I plus III => IV" do
    expect(Knife.add("I", "III")).to eq("IV")
  end

  it "should add I plus IV => V" do
    expect(Knife.add("I", "IV")).to eq("V")
  end

  it "should add CCCLXIX + DCCCXLV => MCCXIV" do
    expect(Knife.add("CCCLXIX", "DCCCXLV")).to eq("MCCXIV")
  end
end

