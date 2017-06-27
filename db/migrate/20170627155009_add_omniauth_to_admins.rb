class AddOmniauthToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :provider, :string
    add_column :admins, :uid, :string
  end
end
