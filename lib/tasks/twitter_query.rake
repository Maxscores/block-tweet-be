namespace :twitter_query do
  desc "Query All twitter searches"
  task all: :environment do

    bitcoin_package = GooglePackageBuilder.new.build("bitcoin")
    puts "bitcoing packaged"

    etherium_package =  GooglePackageBuilder.new.build("etherium")
    puts "etherium packaged"

    blockchain_package = GooglePackageBuilder.new.build("blockchain")
    puts "blockchain packaged"

    crypto_package = GooglePackageBuilder.new.build("crypto")
    puts "crypto packaged"
    require "pry"; binding.pry
    HourSentiment.create!(google_package.analyze)
  end

  desc "TODO"
  task bitcoin: :environment do
  end

  desc "TODO"
  task :etherium do

  end

  desc "TODO"
  task :blockchain do

  end

  desc "TODO"
  task :crypto do

  end

end
