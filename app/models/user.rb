class User < ApplicationRecord
	has_many :events
	has_many :tables
	has_many :games
	has_many :table_players

	def self.from_omniauth(auth)
	   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.provider = auth.provider 
	    user.uid      = auth.uid
	    user.name     = auth.info.name
	    user.image    = auth.info.image
	    user.save
	  end
  end
end