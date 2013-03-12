class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.boolean :male
      t.string :document
      t.date :born_at
      t.boolean :student

      t.timestamps
    end
  end
end
