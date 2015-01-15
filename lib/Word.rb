class Word
  @@all_words = []

  define_method(:initialize) do |word, language|
    @word_word = word
    @word_language = language
  end

  define_method(:save) do
    @@all_words.push(self)
  end

  define_method(:word) do
    @word_word
  end

  define_method(:language) do
    @word_language
  end




end
