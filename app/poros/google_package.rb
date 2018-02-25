class GooglePackage
  attr_reader :content

  def initialize()
    @content = []
  end

  def analyze
    GoogleNaturalLanguageService.analyze(content.join(" "))
  end
end
