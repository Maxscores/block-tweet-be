require 'google/cloud/language'

class GoogleNaturalLanguageService
  def self.analyze(text)
    language = Google::Cloud::Language.new

    response = language.analyze_entity_sentiment(content: text, type: :PLAIN_TEXT)

    response.entities
  end

end
