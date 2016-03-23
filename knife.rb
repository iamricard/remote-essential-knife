module Knife
  ORDER = 'MDCLXVI'.freeze

  CONVERSIONS = {
    'IV' => 'IIII',
    'IX' => 'VIIII',
    'XL' => 'XXXX',
    'XC' => 'LXXXX',
    'CD' => 'CCCC',
    'CM' => 'DCCCC'
  }.freeze

  COMPRESSIONS = {
    'IIIII' => 'V',
    'VV' => 'X',
    'XXXXX' => 'L',
    'LL' => 'C',
    'CCCCC' => 'D',
    'DD' => 'M'
  }.freeze

  def self.add(a, b)
    compress(
      sort_number(
        uncompress(a) + uncompress(b)
      )
    )
  end

  def self.sort_number(number)
    number.
      split('').
      sort_by! { |n| [ORDER.index(n)] }.
      join
  end

  def self.uncompress(number)
    CONVERSIONS.
      reduce(number) { |acc, conversion| acc.gsub conversion[0], conversion[1] }
  end

  def self.compress(number)
    COMPRESSIONS.
      merge(CONVERSIONS.invert).
      reduce(number) { |acc, compression| acc.gsub compression[0], compression[1] }
  end
end
