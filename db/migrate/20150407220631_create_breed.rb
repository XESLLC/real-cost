class CreateBreed < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :breed
      t.integer :lifespan
      t.integer :training_factor
      t.integer :health_factor

      t.timestamps
    end
  end
end
