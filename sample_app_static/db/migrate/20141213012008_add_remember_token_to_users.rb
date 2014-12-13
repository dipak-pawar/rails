class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    #rails g migration add_remember_token_to_users remember_token:string
    add_column :users, :remember_token, :string
  end
end
