class Assignment < ActiveRecord::Base	
  	attr_accessible :body, :title

  	has_many :comments
  	belongs_to :user

  	default_scope order('Created_at DESC')

   	state_machine initial: :open do
    state :open, value: 0
    state :pending, value: 1
#	state :review, value: 2
#	state :published, value: 3
#
    event :pending do
    	transition :open => :pending
    end

#   event :review do
#		transition :pending => :review	
# 	end

#   event :published
#   	transition :review => :published
#   end
end

  assignment = Assignment.create
  assignment.pending 
# assignment.can_hide? # => false
# assignment.hide #=> false
# assignment.hide! # Exception (Cannot transition state via :hide from :pending)
# assignment.open # => true
# assignment.hide # => true
end
