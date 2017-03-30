class AddToProfile < ActiveRecord::Migration[5.0]
  def change
     add_column :profiles, :title, :string
     add_column :profiles, :biography, :text
  end
end
