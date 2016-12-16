require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
	before do
		User.destroy_all
		@bob = User.create!(username: "Bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
		@bob.profile.update(:gender => "Male", :f_level => "Expert", :age => 23, :county => "Broxbourne", :description => "I am Aamzing!")
		# @image = Image.new(Rails.root + 'spec/fixtures/files/steve.jpg')
		# @image2 = Image.new(Rails.root + 'spec/fixtures/files/logo.png')
	end

	it "should update images" do
		@bob.profile.images.create(image: File.open(File.join(Rails.root, '/spec/fixtures/files/logo.png')))
		expect(@bob.profile.images.count).to be 1
	end
end
