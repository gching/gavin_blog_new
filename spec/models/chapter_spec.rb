require 'spec_helper'


describe Chapter do

	it "has a valid factory" do
		expect(build(:chapter)).to be_valid
	end

	it "is valid with an title and body" do
		chapter = Chapter.new(title: "Test Chapter", body: "Lorem ipsum beta")
		expect(chapter).to be_valid
	end

	it "is invalid without a title" do
		expect(build(:chapter, title: nil)).to have(1).errors_on(:title)
	end

	it "is invalid without a body" do
		expect(build(:chapter, body: nil)).to have(1).errors_on(:body)
	end



end
