class AddAbilitiesMaskToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :abilities_mask, :integer, default: 0, null: false
  end
end
