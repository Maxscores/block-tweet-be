require 'google/cloud/language'

class GoogleNaturalLanguageService
  def self.analyze(text)
    language = Google::Cloud::Language.new

    response = language.analyze_sentiment(content: text, type: :PLAIN_TEXT)

    response.document_sentiment
  end

end

Google::Auth::ServiceAccountCredentials.make_creds(
  scope: 'https://www.googleapis.com/auth/drive',
  json_key_io: StringIO.new(ENV['GOOGLE_APPLICATION_CREDENTIALS'])
)
