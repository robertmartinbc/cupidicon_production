class User < ActiveRecord::Base

  # has_many :posts, :class_name => 'Assignment'
  # has_many :projects, :class_name => 'Assignment'
  has_many :assignments
  has_many :writer_actions, class_name: "Transactions"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  state_machine initial: :available do
    state :available, value: 0
    state :engaged, value: 1

    event :write do 
      transition :available => :engaged
    end
    
  end

  before_create :set_member

  ROLES = %w[member moderator admin]
def role?(base_role)
  role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
end 

private

  def set_member
    self.role = 'member'
  end 
end
