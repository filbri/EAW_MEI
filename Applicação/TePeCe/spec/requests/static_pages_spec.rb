require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'TePeCe'" do
      visit '/static_pages/home'
      expect(page).to have_content('TePeCe')
    end
	
	it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("TePeCe | Home")
    end
  end
  
  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
	
	it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("TePeCe | Contact")
    end
  end
  
   describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
	
	it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("TePeCe | About Us")
    end
	
  end

  
  
end