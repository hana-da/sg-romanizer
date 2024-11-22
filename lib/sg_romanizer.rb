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

    ARABIC_ROMAN.each_key do |unit|
      while arabic >= unit
        roman << ARABIC_ROMAN[unit]
        arabic -= unit
      end
    end

    roman
  end

  def deromanize(roman)
    arabic = 0

    ROMAN_ARABIC.each_key do |unit|
      while roman.start_with?(unit)
        arabic += ROMAN_ARABIC[unit]
        roman = roman.delete_prefix(unit)
      end
    end

    arabic
  end
end
