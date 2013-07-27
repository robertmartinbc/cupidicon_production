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
    state :revision, value: 4
    state :resubmit, value: 5   
    state :published, value: 6

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

    event :cancel do 
      transition :write => :open
    end

    event :authorize do 
      transition :write => :authorize
    end

    event :published do
      transition :authorize => :published
    end

    event :reject do 
      transition :authorize => :open
    end

    event :revision do
      transition :authorize => :revision
    end

    event :resubmit do
      transition :revision => :resubmit
    end

    event :revision do
      transition :resubmit => :revision
    end

    event :published do
      transition :resubmit => :published
    end

    end
end
