require 'rails_helper'

RSpec.describe LikesController, type: :controller do
	include Warden::Test::Helpers

	let(:barvis) {create(:user)}

	describe "Like" do
		before do
			@image = File.new(Rails.root + 'spec/fixtures/files/steve.jpg')
			# @image.save
			sign_in barvis
		end


		it "should like an image" do
			process :create, method: :post, id: barvis.id,
		          params: {
				          likable: {
						          likable_type: "Image",
				              likable_id: @image
				          }
		          }
			expect(barvis.user_likes.count).to eq 1
		end

		it "should unlike a liked image" do
			process :create, method: :post, id: barvis.id,
			        params: {
					        likable: {
							        likable_type: "Image",
							        likable_id: @image
					        }
			        }
			expect(barvis.user_likes.count).to eq 1
			process :create, method: :post, id: barvis.id,
			        params: {
					        likable: {
							        likable_type: "Image",
							        likable_id: @image
					        }
			        }
			expect(barvis.user_likes.count).to eq 0
		end
	end
end
