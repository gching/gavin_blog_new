require 'spec_helper'


describe Chapter do
	let(:new_chapter) {build(:chapter)}

	it "has a valid factory" do
		expect(new_chapter).to be_valid
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

end
