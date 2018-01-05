# My original answer

class Integer
  def to_roman
    roman_numeral = ''
    number = self
    while number > 0
      case number
      when (1000..3000)
        roman_numeral << 'M'
        number -= 1000
      when (900..999)
        roman_numeral << 'CM'
        number -= 900
      when (500..899)
        roman_numeral << 'D'
        number -= 500
      when (400..499)
        roman_numeral << 'CD'
        number -= 400
      when (100..399)
        roman_numeral << 'C'
        number -= 100
      when (90..99)
        roman_numeral << 'XC'
        number -= 90
      when (50..89)
        roman_numeral << 'L'
        number -= 50
      when (40..49)
        roman_numeral << 'XL'
        number -= 40
      when (10..39)
        roman_numeral << 'X'
        number -= 10
      when 9
        roman_numeral << 'IX'
        number -= 9
      when (5..8)
        roman_numeral << 'V'
        number -= 5
      when 4
        roman_numeral << 'IV'
        number -= 4
      when (1..3)
        roman_numeral << 'I'
        number -= 1
      end
    end
    roman_numeral
  end
end

# Refactored version after viewing a submitted solution

class Integer
ROMAN_NUMERALS = {
  'M' => 1000,
  'CM' => 900,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

  def to_roman
    roman_numeral = ''
    number = self
    ROMAN_NUMERALS.each do |roman_number, value|
      number_of_roman_letters = number / value
      roman_numeral += roman_number * number_of_roman_letters
      number -= number_of_roman_letters * value
    end
    roman_numeral
  end
end
