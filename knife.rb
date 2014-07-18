module Knife
  ORDER = "MDCLXVI"
  CONVERSIONS = {
    "IV" => "IIII",
    "IX" => "VIIII",
    "XL" => "XXXX",
    "XC" => "LXXXX",
    "CD" => "CCCC",
    "CM" => "DCCCC"
  }

  COMPRESSIONS = {
    "IIIII" => "V",
    "VV" => "X",
    "XXXXX" => "L",
    "LL" => "C",
    "CCCCC" => "D",
    "DD" => "M"
  }

  private
  def self.uncompact(number)
    CONVERSIONS.each do |compressed, uncompressed|
      number.gsub!(compressed, uncompressed)
    end
    number
  end

  def self.sort_number(number)
    number = number.split('')
    number.sort_by! do |n|
      [ORDER.index(n)]
    end
    number.join
  end

  def self.compact(number)
    COMPRESSIONS.each do |uncompressed, compressed|
      number.gsub!(uncompressed, compressed)
    end

    CONVERSIONS.each do |compressed, uncompressed|
      number.gsub!(uncompressed, compressed)
    end
    number
  end

  public
  def self.add(a, b)
    num = self.uncompact(a) + self.uncompact(b)
    num = self.sort_number num
    self.compact num
  end

end

