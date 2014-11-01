## Seeds current database with 10 Chapter posts with lorem data

namespace :db do
	task populate: :environment do
		Chapter.destroy_all
		puts "Seeding with 10 Chapters now!"
		 10.times do
			Chapter.create(title:Faker::Lorem.sentence, body:Faker::Lorem.paragraph(10))
	  end
	  	puts "Finished!"

	end
end
