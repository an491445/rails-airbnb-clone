class AddForeignKeyToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_reference(:profiles, :user)
  end
end
