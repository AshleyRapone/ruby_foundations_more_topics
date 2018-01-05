# My original answer

class Phrase
  def initialize(string)
    @string = string
    word_count
  end

  def word_count
    list = Hash.new(0)
    modified_string = @string.gsub(/[^a-zA-Z0-9']/, ' ')

    modified_string.split.each do |word|
      word = word.delete(word[0]) if word[0] == '\''
      word = word.delete(word[-1]) if word[-1] == '\''
      list[word.downcase] += 1
    end
    list
  end
end

# Refactored version after viewing a submitted solution

class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    list = Hash.new(0)
    @string.scan(/\b[\w']+\b/) do |word|
      list[word.downcase] += 1
    end
    list
  end
end
