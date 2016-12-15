class ConversationsController < ApplicationController
	before_action :authenticate_user! #, :premium_user_only

	def index
		@conversations = Conversation.all
	end

	def create
		if Conversation.between(params[:sender_id],params[:recipient_id])
				   .present?
			@conversation = Conversation.between(params[:sender_id],
			                                     params[:recipient_id]).first
		else
			@conversation = Conversation.create!(conversation_params)
		end
		redirect_to conversation_messages_path(@conversation)
	end

	private

	# def premium_user_only
	# 	unless current_user.account.is_premium?
	# 		redirect_to :back, :alert => "Access denied."
	# 	end
	# end

	def conversation_params
		params.permit(:sender_id, :recipient_id)
	end
end
