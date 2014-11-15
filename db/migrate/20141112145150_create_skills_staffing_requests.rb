class CreateSkillsStaffingRequests < ActiveRecord::Migration
  def change
    create_table :skills_staffing_requests do |t|
    	t.belongs_to :skill
      t.belongs_to :staffing_request
    end
  end
end
