namespace :twitter_query do
  desc "Query All twitter searches"
  task all: :environment do
    google_package = GooglePackage.new()
    google_package.text << Rake::Task['twitter_query:bitcoin'].execute
    google_package.text << Rake::Task['twitter_query:etherium'].execute
    google_package.text << Rake::Task['twitter_query:blockchain'].execute
    google_package.text << Rake::Task['twitter_query:crypto'].execute
    HourSentiment.create(google_package.analyze)
  end

  desc "TODO"
  task :bitcoin do
    GooglePackageBuilder.build("bitcoin")
  end

  desc "TODO"
  task :etherium do
    GooglePackageBuilder.build("etherium")
  end

  desc "TODO"
  task :blockchain do
    GooglePackageBuilder.build("blockchain")
  end

  desc "TODO"
  task :crypto do
    GooglePackageBuilder.build("crypto")
  end

end
