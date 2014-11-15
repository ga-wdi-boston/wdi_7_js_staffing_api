class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :staffing_request, index: true

      t.timestamps null: false
    end
  end
end
