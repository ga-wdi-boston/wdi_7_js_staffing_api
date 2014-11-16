class CreateStaffingRequests < ActiveRecord::Migration
  def change
    create_table :staffing_requests do |t|
      t.integer :percentage
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, null: false, default: 0 # Defaults to 'open'
      t.belongs_to :title, index: true
      t.belongs_to :project, index: true

      t.timestamps null: false
    end
  end
end
