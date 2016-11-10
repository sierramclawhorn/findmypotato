class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.float :lat
      t.float :lng
      t.integer :user_id

      t.timestamps
    end
  end
end
