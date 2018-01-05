# My original answer

class DNA
  attr_reader :strand1

  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    strand1_chain = strand1.chars
    strand2_chain = strand2.chars

    strand_size = shortest_strand(strand2)

    counter = 0
    sum = 0
    while counter < strand_size
      sum += 1 if strand1_chain[counter] != strand2_chain[counter]
      counter += 1
    end
    sum
  end

  private

  def shortest_strand(strand2)
    if strand1.length< strand2.length
      strand1.length
    elsif strand1.size > strand2.size
      strand2.size
    else
      strand1.size
    end
  end
end

# Refactored version after viewing a submitted solution

class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    strand1 = @strand1[0, strand2.length]
    strand1.chars.zip(strand2.chars).count { |pair| pair.first != pair.last }
  end
end
