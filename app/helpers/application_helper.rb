module ApplicationHelper
	def showname(id)
		user = User.find(id).name
	end

	def showimage(id)
		img = User.find(id).image
	end

	def event_date(date)
		Time.now.strftime("%e-%m-%Y     %H:%M")
	end
end
