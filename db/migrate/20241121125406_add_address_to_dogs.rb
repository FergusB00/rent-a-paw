class AddAddressToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :Address, :string
  end
end
