class Vaidya < ActiveRecord::Base
  has_and_belongs_to_many   :categories_ds
   belongs_to               :user
   has_many                 :enquiries 
   accepts_nested_attributes_for :enquiries
   attr_accessible          :categories_d_ids, :name, :address_line_1, :address_line_2, :address_line_3, 
                            :state, :city, :country, :contact_no, :fax_no, :website_url, :qualification, 
                            :speciality, :affiliation, :awards, :user_id, :user_ids, :vaidya_id, :vaidya_ids
end
