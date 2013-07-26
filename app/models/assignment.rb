class Assignment < ActiveRecord::Base 
    attr_accessible :body, :title

    has_many :comments
    belongs_to :user

    default_scope order('Created_at DESC')

    state_machine initial: :open do
    state :open, value: 0
    state :pending, value: 1
    state :review, value: 2
    state :published, value: 3

#
    event :pending do
      transition :open => :pending
    end

    event :renew do 
      transition :pending => :open
    end

    event :review do
      transition :pending => :review
    end

    event :cancel do
      transition :review => :open
    end

    event :published do
      transition :review => :published
    end
  end
end
