require 'spec_helper'


describe Chapter do
	let(:first_chapter) {build(:chapter)}
	it "has a valid factory" do
		expect(first_chapter).to be_valid
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


	it "has a slug attribute and it should eql" do
		chapter = create(:chapter)
		title = chapter.title
		expect(chapter.slug).to eql(title.parameterize)
	end

	it "should raise an error if it generates an admin slug" do
		expect(build(:chapter, title: "admin")).to have(1).errors_on(:slug)
	end

	describe "for next, previous, and random" do
		before :each do
			@chapter1 = create(:chapter)
			@chapter2 = create(:chapter, title: "another_chapter")
		end
		it "should generate a random id other then it's own" do
			expect(@chapter2.random_chapter).to_not eql(@chapter2)
		end

		it "should have the next one be chapter 2 from chapter 1" do
			expect(@chapter1.next).to eql(@chapter2)
		end

		it "should have the previous one be chapter 1 from chapter 2" do
			expect(@chapter2.previous).to eql(@chapter1)
		end
	end

end
