module EventsHelper
	def event_date(date)
		Time.now.strftime("%e-%m-%Y     %H:%M")
	end

	def time_in_minutes(date)
		t = date.strftime("%H").to_i
		t = t * 60
		t = t + date.strftime("%M").to_i
		return t
	end

	def showname(id)
		user = User.find(id).name
	end

	def showimage(id)
		img = User.find(id).image
	end
	def userexist?(id)
		TablePlayer.where(table_id: id, user_id: current_user.id).present?				
	end
end
