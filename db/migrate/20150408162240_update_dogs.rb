class UpdateDogs < ActiveRecord::Migration
  def change
    remove_column :dogs, :breed, :string
    add_column :dogs, :breed_id, :integer
  end
end
