class AddNumberOfChildrenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :number_of_children, :string
    add_column :users, :age, :string
    add_column :users, :comments, :string
    add_column :users, :phone_number, :string
    add_column :users, :location, :string
    add_column :users, :preferred_day, :string
    add_column :users, :course_preference, :string
  end
end
