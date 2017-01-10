require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
	before do
		@bob = User.create!(username: "Bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
		@bob.profile.update(:gender => "Male", :f_level => "Expert", :age => 23, :county => "Broxbourne", :description => "I am Aamzing!")
		# @image = Image.new(Rails.root + 'spec/fixtures/files/steve.jpg')
		# @image2 = Image.new(Rails.root + 'spec/fixtures/files/logo.png')
		sign_in @bob
	end

	describe "User Images" do

		it "should let users see all their images" do
			get :index, params: {user_id: @bob.id}
			expect(response.status).to eq 200
		end

		it "should upload images" do
			process :create, method: :post,
			        params: {
					            user_id: @bob.id,
							        file: File.new(Rails.root + 'spec/fixtures/files/steve.jpg')
			        },
			        format: :json
			expect(@bob.profile.images.count).to eq 1
		end

		it "should delete image" do
			process :create, method: :post,
			        params: {
					        user_id: @bob.id,
					        file: File.new(Rails.root + 'spec/fixtures/files/steve.jpg')
			        },
			        format: :json
			process :destroy, method: :delete,
		          params: {
				          user_id: @bob.id,
		              id: 2
		          }
			expect(@bob.profile.images.count).to eq 0
		end
	end
end

