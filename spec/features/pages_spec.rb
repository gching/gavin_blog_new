require 'spec_helper'


describe "When going through pages" do
	let(:title) {"My Story A detailed book on my \"rife\" journey."}
	it "have root path be the blog / story book" do
		visit '/'
		expect(page).to have_content title
	end

	it "should have a link to about page" do
		click_link "About"
		expect(page).to have content "About Me"
	end

	
end