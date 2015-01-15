class Definition
  @@all_defs = []

  define_method(:initialize) do |definition, language|
    @def_def = definition
    @def_lang = language
  end

  define_method(:save) do
    @@all_defs.push(self)
  end

  define_method(:definition) do
    @def_def
  end

  define_method(:language) do
    @def_lang
  end

end
