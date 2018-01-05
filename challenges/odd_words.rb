class Words
  def self.odd_words(sentence)
    return '' if self.invalid_input(sentence)
    results = []
    words = sentence.split
    words.each_with_index do |word, index|
    if index.odd?
      if word[-1] == '.'
        results << word[0..-2].reverse + '.'
      else
        results << word.reverse
      end
    else
      results << word
    end
    end
    results.join(' ')
  end

  def self.invalid_input(sentence)
    sentence =~ /[ ]\.|.\../ ||
    sentence[-1] != '.' ||
    sentence[0..-2].include?('.') ||
    sentence == '.'
  end
end

# test cases
p Words.odd_words('whats the matter with kansas.') == 'whats eht matter htiw kansas.'
p Words.odd_words('whats the matter with kansas son.') == "whats eht matter htiw kansas nos."
p Words.odd_words('hello') == ''
p Words.odd_words('hell.o.') == ''
p Words.odd_words('') == ''
p Words.odd_words('.') == ''
p Words.odd_words(' hello .  ') == ''
p Words.odd_words('hello word .') == ''
