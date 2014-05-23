require 'spec_helper'


describe "When going through pages" do
	let(:title) {"My Story A detailed book on my \"rife\" journey."}
	before :each do
		visit '/'
	end

	it "have root path be the blog / story book" do
		expect(page).to have_content title
	end

	it "should have a link to about page" do
		click_link "Who dat?"
		expect(page).to have_content "Gavin Ching"
	end


end
