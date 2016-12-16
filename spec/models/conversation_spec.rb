require 'rails_helper'

RSpec.describe Conversation, type: :model do
	before do
		User.destroy_all
		@bob = User.create!(username: "bob", email: "bob@bobland.net", password: "123456", password_confirmation: "123456")
		@alice = User.create!(username: "alice",email: "alice@alice.net", password: "123456", password_confirmation: "123456")
		@conversation2 = @bob.conversations.create!(recipient: @alice)
		@conversation1 = @alice.conversations.create!(recipient: @bob)
	end

	describe "Conversation" do
		before do
			@no_sender = Conversation.create(recipient: @bob)
			@no_recipient = @bob.conversations.create()
			@conversation2 = @alice.conversations.create(recipient: @bob)
			@conversation3 = @bob.conversations.create(recipient: @alice)
		end

		context "with invalid creation criteria" do
			it "should not be valid without a sender" do
				expect(@no_sender).to_not be_valid
			end
			it "should not be valid without a recipient" do
				expect(@no_recipient).to_not be_valid
			end
			it "should list all conversations" do
				@conversation = Conversation.all.between(@bob, @alice)
				expect(@conversation.count).to be 2
			end
			it "should not be valid if duplicate of already existing conversation between two users" do
				expect(@conversation2).to_not be_valid
				expect(@conversation3).to_not be_valid
				expect(@conversation2.errors.messages.keys).to include :duplicate_conversation
				expect(@conversation3.errors.messages.keys).to include :duplicate_conversation
				expect(@conversation2.errors.messages).equal? ["A conversation already exists between this sender and recipient"]
				expect(@conversation3.errors.messages).equal? ["A conversation already exists between this sender and recipient"]
			end
		end
	end

end
