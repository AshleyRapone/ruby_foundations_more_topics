# My original answer

class InvalidCodonError < StandardError; end

class Translation
  PROTEINS = {['AUG'] => 'Methionine', ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine', ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine', ['UGU', 'UGC'] => 'Cysteine', ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP' }

  def self.of_codon(codon)
    PROTEINS.each do |codons, protein|
      return protein if codons.include?(codon)
    end
  end

  def self.of_rna(rna)
    raise InvalidCodonError if !!(rna =~ /[BD-FH-TV-Z]/i) == true
    results = []
    n1 = 0
    n2 = 2
    while n2 < rna.size
      protein_chain = self.of_codon(rna[n1..n2])
      break if protein_chain == 'STOP'
      results << protein_chain
      n1 += 3
      n2 += 3
    end
    results
  end
end

# Refactored version after viewing a submitted solution

class InvalidCodonError < StandardError; end

class Translation
  PROTEINS = {['AUG'] => 'Methionine', ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine', ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine', ['UGU', 'UGC'] => 'Cysteine', ['UGG'] => 'Tryptophan',
    ['UAA', 'UAG', 'UGA'] => 'STOP' }

  def self.of_codon(codon)
    PROTEINS.each do |codons, protein|
      return protein if codons.include?(codon)
    end
  end

  def self.of_rna(rna)
    raise InvalidCodonError if !!(rna =~ /[BD-FH-TV-Z]/i) == true
    results = []
    codons = rna.scan(/.../)
    codons.each do |codon|
      result = of_codon(codon)
      return results if result == 'STOP'
      results << result
    end
    results
  end
end
