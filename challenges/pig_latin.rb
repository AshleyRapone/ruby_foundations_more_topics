# My original answer

class PigLatin
  def self.translate(word)
    words = word.split
    results = []
    words.each do |word|
      if word.match(/^[aeiou]|yt|xr/)
        results << word + 'ay'
      elsif word.match(/^[^aeiou]/)
        constants = word.scan(/^([^aeiou]*qu|[^aeiou]+)/)
        constants_count = constants[0][0].length
        first_word = word[0..(constants_count - 1)]
        last_word = word[constants_count..-1]
        results << last_word + first_word + 'ay'
      end
    end
    results.join(' ')
  end
end

# Refactored version after viewing a submitted solution

class PigLatin
  def self.translate(word)
    words = word.split
    results = []
    words.each do |word|
      if word.match(/^[aeiou]|yt|xr/)
        results << word + 'ay'
      elsif word.match(/^[^aeiou]/)
        results << self.parse(word)
      end
    end
    results.join(' ')
  end

  def self.parse(word)
    constants = word.scan(/^([^aeiou]*qu|[^aeiou]+)/)
    constants_count = constants[0][0].length
    first_word = word[0..(constants_count - 1)]
    last_word = word[constants_count..-1]
    last_word + first_word + 'ay'
  end
end
