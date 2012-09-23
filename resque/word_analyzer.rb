class WordAnalyzer
  @queue = "word_analysis"

  def self.perform(word)
    puts "todo #{word}"

    sleep 10

    puts "finished on #{word}"
  end
end