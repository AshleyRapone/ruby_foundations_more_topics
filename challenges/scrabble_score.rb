# My original answer

LETTERS = {['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
  ['D', 'G'] => 2, ['B', 'C', 'M', 'P'] => 3, ['F', 'H', 'V', 'W', 'Y'] => 4,
  ['K'] => 5, ['J', 'X'] => 8, ['Q', 'Z'] => 10}

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 if invalid_word
    @letters = @word.upcase.chars
    sum = 0
    @letters.each do |letter|
      LETTERS.each do |key, value|
        sum += LETTERS[key] if key.include?(letter)
      end
    end
    sum
  end

  def invalid_word
    @word =~ /[^a-z]/i || @word == nil
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

# Refactored version after viewing a submitted solution

LETTERS = {['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
  ['D', 'G'] => 2, ['B', 'C', 'M', 'P'] => 3, ['F', 'H', 'V', 'W', 'Y'] => 4,
  ['K'] => 5, ['J', 'X'] => 8, ['Q', 'Z'] => 10}

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 if invalid_word
    @letters = @word.upcase.chars
    sum = 0
    @letters.each do |letter|
      LETTERS.each do |key, value|
        sum += LETTERS[key] if key.include?(letter)
      end
    end
    sum
  end

  def invalid_word
    @word =~ /[^a-z]/i || @word == nil
  end

  def self.score(word)
    new(word).score
  end
end
