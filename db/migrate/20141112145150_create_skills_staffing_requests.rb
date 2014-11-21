class CreateSkillsStaffingRequests < ActiveRecord::Migration
  def change
    create_table :skills_staffing_requests do |t|
      t.belongs_to :skill, null: false
      t.belongs_to :staffing_request, null: false
    end
  end
end
