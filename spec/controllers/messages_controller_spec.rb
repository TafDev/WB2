require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
	include Warden::Test::Helpers

	describe "Messaging" do
		let(:barvis) {create(:user)}
		let(:mavis) {create(:user2)}

		before do
			sign_in barvis
			@conversation = barvis.conversations.create!(sender_id: barvis.id, recipient_id: mavis.id)
		end

		it "should see all messages in a conversation" do
			get :index, params: {
					conversation_id: @conversation.id
			}
			expect(response.status).to be 200
		end

		it "should exist within a conversation" do
			message = Message.new(user_id: barvis)
			expect(message).not_to be_valid
		end

		it "create a message" do
			process :create, method: :post,
			        params: {
					        conversation_id: @conversation.id,
			            message: {
					            body: "hello",
			                sender_id: barvis
			            }
			        }
		end
	end
end
