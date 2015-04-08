class UpdateBreeds < ActiveRecord::Migration
  def change
    add_column :breeds, :size, :string
  end
end
