module ApplicationCable
  class Channel < ActionCable::Channel::Base

	  def get_location(data)
		  user = User.find_by(id: data["user_id"])
		  unless data["latitude"].nil? || data["longitude"].nil?
			  user.profile.update(:latitude => data["latitude"].to_f, :longitude => data["longitude"].to_f)
		  end
	  end

  end
end
