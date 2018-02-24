class GooglePackage
  attr_reader :text

  def initialize()
    @text = ""
  end

  def analyze
    GoogleNaturalLanguageService.analyze(text)
  end
end
