class AddAddressToDogs < ActiveRecord::Migration[7.1]
  def change
    add_column :dogs, :address, :string
  end
end
