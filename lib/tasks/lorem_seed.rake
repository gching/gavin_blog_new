## Seeds current database with 5 Chapter posts with lorem data
=begin
namespace :db do
	desc "lorem_seed"
	puts "Seeding with 5 Chapters now!"
	 5.times do
		Chapter.create(title:Faker::Lorem.sentence, body:Faker::Lorem.paragraph(10))
  	end
  	puts "Finished!"


end

=end