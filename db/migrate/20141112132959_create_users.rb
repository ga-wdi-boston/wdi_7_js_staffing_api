class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :role
      t.belongs_to :title, index: true

      t.timestamps null: false
    end
  end
end
