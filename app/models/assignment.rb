class Assignment < ActiveRecord::Base	
  	attr_accessible :body, :title

  	has_many :comments
  	belongs_to :user

  	default_scope order('Created_at DESC')
end
