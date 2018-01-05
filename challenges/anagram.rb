# My original answer

class Anagram
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match(words)
    list = words
    results = []
    list.each do |word|
      results << word if anagram?(word)
    end
    results
  end

  private

  def anagram?(word)
    same_size?(word) && same_letters_and_case_insensitive?(word) && not_the_same_word(word)
  end

  def same_size?(word)
    word.size == string.size
  end

  def same_letters_and_case_insensitive?(word)
    word.downcase.chars.sort.join == string.downcase.chars.sort.join
  end

  def not_the_same_word(word)
    word.downcase != string
  end
end

# Refactored version after viewing a submitted solution

class Anagram
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    word.downcase != string && word.downcase.chars.sort == string.downcase.chars.sort
  end
end
