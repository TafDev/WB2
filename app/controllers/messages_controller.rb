class MessagesController < ApplicationController
	before_action :find_conversation
	# load_and_authorize_resource


	def index
		@messages = @conversation.messages
		@message = @conversation.messages.new
		# authorize! :index, @messages
	end

	def new
		@message = @conversation.messages.new
	end

	def create
		message = @conversation.messages.new(message_params)
		if message.save
			ActionCable.server.broadcast("messaging_channel", body: message.body,
																												user: message.user,
																												name: message.user.username || message.user.name,
																												id: message.conversation.id
			)
		end
	end

	private

	def message_params
		params.require(:message).permit(:body, :user_id)
	end

	def find_conversation
		@conversation = Conversation.find(params[:conversation_id])
	end

end
