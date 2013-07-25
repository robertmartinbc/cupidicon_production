class Assignment < ActiveRecord::Base
	has_many :comments
  	attr_accessible :body, :title
end
