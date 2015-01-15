class Term
  @@all_terms = []

  define_method(:initialize) do |word, definition|
    @word = [word]
    @definition = [definition]
    # @entry = [@word, @definition]
  end

  define_method(:word) do
    @word.join("; ").to_s()
  end

  define_method(:definition) do
    @definition.join("; ").to_s()
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

  # define_singleton_method(:redefine) do |search_word, new_definition|
  #   @@all_terms.each() do |entry|
  #     if entry.word().==(search_word)
  #       entry.definition().replace(new_definition)
  #     end
  #   end
  # end

  define_singleton_method(:search) do |search_word|
    @@all_terms.each() do |entry|
      if entry.word().include?(search_word)
        return entry
      end
    end
  end

  define_method(:redefine) do |new_definition|
    arrayizer = [new_definition]
    @definition = arrayizer
  end

  define_method(:append) do |append_definition|
    @definition.push(append_definition)
  end

  define_method(:woppend) do |woppend_word|
    @word.push(woppend_word)
  end

end
