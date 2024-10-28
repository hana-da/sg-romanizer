# frozen_string_literal: true

class SgRomanizer
  ARABIC_ROMAN = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze
  ROMAN_ARABIC = ARABIC_ROMAN.invert.freeze

  def romanize(arabic)
    roman = +''

    ARABIC_ROMAN.each_pair do |a, r|
      next if (i = arabic - a).negative?

      roman << r
      arabic = i
      redo
    end

    roman
  end

  def deromanize(roman)
    arabic = 0

    ROMAN_ARABIC.each_pair do |r, a|
      next unless roman.start_with?(r)

      arabic += a
      roman = roman.delete_prefix(r)
      redo
    end

    arabic
  end
end
