class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :body

      t.integer :state


      t.timestamps
    end
  end
end
