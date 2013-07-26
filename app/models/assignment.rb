class Assignment < ActiveRecord::Base 
    attr_accessible :body, :title

    has_many :comments
    belongs_to :user

    default_scope order('Created_at DESC')

    state_machine initial: :open do
    state :open, value: 0
    state :review, value: 1
    state :write, value: 2
    state :authorize, value: 3
    state :published, value: 4

#
    event :review do
      transition :open => :review
    end

    event :renew do 
      transition :review => :open
    end
   
    event :write do 
      transition :review => :write
    end

    event :authorize do 
      transition :write => :authorize
    end

    event :published do
      transition :authorize => :published
    end
  end
end
