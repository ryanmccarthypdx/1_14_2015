class Term
  @@all_terms = []

  define_method(:initialize) do |word, definition|
    @word = word
    @definition = definition
    @entry = [@word, @definition]
  end

  define_method(:word) do
    @word
  end

  define_method(:definition) do
    @definition
  end

  define_method(:save) do
    @@all_terms.push(self)
  end

  define_singleton_method(:clear) do
    @@all_terms = []
  end

  define_singleton_method(:all) do
    @@all_terms
  end

  define_singleton_method(:redefine) do |search_word, new_definition|
    @@all_terms.each() do |entry|
      if entry.word().==(search_word)
        entry.definition().replace(new_definition)
      end
    end
  end



end
