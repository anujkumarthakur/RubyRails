class AddUniqueConstraintsToUser2 < ActiveRecord::Migration[7.0]
  def change
    add_index :user2s, :username, unique: true
    add_index :user2s, :email, unique: true
  end
end
