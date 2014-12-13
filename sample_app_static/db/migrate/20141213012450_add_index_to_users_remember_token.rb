class AddIndexToUsersRememberToken < ActiveRecord::Migration
  def change
    #this will add index column to user model for remember token so you can search by that remember token
    add_index :users, :remember_token
  end
end
