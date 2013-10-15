FactoryGirl.define do
  factory :chapter do
  	title									Faker::Lorem.sentence
  	body 									Faker::Lorem.paragraph(4)
  end
end