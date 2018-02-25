namespace :twitter_query do
  desc "Query All twitter searches"
  task all: :environment do

    bitcoin_package = GooglePackageBuilder.new.build("bitcoin")
    puts "bitcoin packaged"
    bitcoin_sentiment = bitcoin_package.analyze
    HourSentiment.create!(score: bitcoin_sentiment.score,
                          magnitude: bitcoin_sentiment.magnitude,
                          query: "bitcoin")
    puts "bitcoin received"

    etherium_package =  GooglePackageBuilder.new.build("ethereum")
    puts "ethereum packaged"
    etherium_sentiment = etherium_package.analyze
    HourSentiment.create!(score: etherium_sentiment.score,
                          magnitude: etherium_sentiment.magnitude,
                          query: "ethereum")

    blockchain_package = GooglePackageBuilder.new.build("blockchain")
    puts "blockchain packaged"
    blockchain_sentiment = blockchain_package.analyze
    HourSentiment.create!(score: blockchain_sentiment.score,
                          magnitude: blockchain_sentiment.magnitude,
                          query: "blockchain")

    crypto_package = GooglePackageBuilder.new.build("crypto")
    puts "crypto packaged"
    crypto_sentiment = crypto_package.analyze
    HourSentiment.create!(score: crypto_sentiment.score,
                          magnitude: crypto_sentiment.magnitude,
                          query: "crypto")
  end
end
