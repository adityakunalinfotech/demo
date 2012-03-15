class Hospital < ActiveRecord::Base
  belongs_to :user 
  has_many   :enquiries
  attr_accessible :user_id,:name, :address_line_1, :address_line_2, :address_line_3, :emergency_services,
                  :ambulance_contact, :pharmacy_details, :no_of_private_rooms, :no_of_wards,
                  :specialities, :doctor_list, :user_ids
end
