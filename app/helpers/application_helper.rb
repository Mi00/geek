module ApplicationHelper
	def showname(id)
		user = User.find(id).name
	end

	def showimage(id)
		img = User.find(id).image
	end
end
