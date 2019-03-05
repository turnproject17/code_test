require "rails_helper"
    

RSpec.feature "Widget management", :type => :feature do
	before(:all) do 
		user = User.create(name: "Clara Oswald", email: "clara@alkhemy.co")
    article = Article.create(title: "Article One", content: "Content", published_at: Time.now + 1.weeks, author_id: user.id)
    article = Article.create(title: "Article One", content: "Content", published_at: Time.now, author_id: user.id)
	end


  scenario "Correctly displays Articles" do
    visit "/articles"
    expect(page).to have_text("One Clara Oswald published 2019-03-05")
  end

  scenario "Correctly filters Articles by publishing status for draft" do
	    visit "/articles?status=draft"
	    expect(page).to have_text("One Clara Oswald draft")
  end

  scenario "Correctly filters Articles by publishing status for published" do
	    visit "/articles?status=published"
	    expect(page).to have_text("One Clara Oswald published")
  end
end
