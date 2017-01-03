module EventsHelper
	

	def time_in_minutes(date)
		t = date.strftime("%H").to_i
		t = t * 60
		t = t + date.strftime("%M").to_i
		return t
	end


	
	def userexist?(id)
		TablePlayer.where(table_id: id, user_id: current_user.id).present?				
	end
end
