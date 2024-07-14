class WordCount; end

class Phrase < WordCount
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    delimiters = [' ', "\n", "\t", ',', ';', '.', '!', '?', '"', '(', ')']
    regex = Regexp.union(delimiters)
    counts = Hash.new(0)

    @phrase.downcase.split(regex).each do |word|
      word.gsub!(/[^a-zA-Z0-9']/, '')
      word.sub!(/^'/, '')
      word.sub!(/'$/, '')

      next if word.empty?

      counts[word] += 1
    end

    counts
  end
end
