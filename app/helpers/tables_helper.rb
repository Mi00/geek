module TablesHelper
	def event(id)
  		Event.find(id)
  	end

  	def time_in_minutes(date)
		t = date.strftime("%H").to_i
		t = t * 60
		t = t + date.strftime("%M").to_i
		return t
	end

end
