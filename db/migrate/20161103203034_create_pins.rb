class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :locations #check to see what kind of obj API is sending back!! (might not be a string)
      t.integer :user_id

      t.timestamps
    end
  end
end
