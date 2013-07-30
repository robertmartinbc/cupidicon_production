class Transaction < ActiveRecord::Base
  attr_accessible :transaction_type, :assignment_id, :writer_id
  belongs_to :assignment
  belongs_to :writer, class_name: "User"
end
