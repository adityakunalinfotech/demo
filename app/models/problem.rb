class Problem < ActiveRecord::Base
  belongs_to :patient
   attr_accessible :patient_id, :symptom, :problem, :started, :ended, :journal_entry, :user_id
end
