class LocationChannel < ApplicationCable::Channel
  def subscribed
	  stream_from "location_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update_position(data)
	  get_location(data)
	  ActionCable.server.broadcast("location_channel", data)
  end

end
