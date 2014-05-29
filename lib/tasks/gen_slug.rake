## gen_slug.rake
## Used to generate each chapter's slug.

namespace :db do
  desc "Generates slugs for each chapter."
  task "gen_slug" => :environment do
    puts "Going through each Chapter and setting a slug."
    Chapter.find_each(&:save)
    puts "Done generating slugs."
  end

end
