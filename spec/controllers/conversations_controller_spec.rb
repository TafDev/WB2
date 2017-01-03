require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
	include Warden::Test::Helpers

	describe "Conversation" do
		let(:barvis) {create(:user)}
		let(:mavis) {create(:user2)}

		before do
			sign_in barvis
		end

		it "should see all conversations" do
			get :index
			expect(response.status).to be 200
		end

		it "create a new conversation" do
			process :create, method: :post,
		          params: {
				          sender_id: barvis.id,
		              recipient_id: mavis.id
		          }
			expect(barvis.conversations.count).to be 1
		end

		it "should not create duplicate conversations between users" do
			process :create, method: :post,
			        params: {
					        sender_id: barvis.id,
					        recipient_id: mavis.id
			        }
			sign_in mavis
			process :create, method: :post,
			        params: {
					        sender_id: mavis.id,
					        recipient_id: barvis.id
			        }
			expect(barvis.conversations.count).to be 1
		end
	end

end
