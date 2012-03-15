class EnquiriesController < ApplicationController
  def new
    # @enquiries  = Enquiry.find_all_by_id(params[:enquiry])
    # @vaidya = Vaidya.find_by_user_id(params[:id])
     # @hospital  = Hospital.find_by_id(params[:hospital])
     @enquiry   = Enquiry.new
  end
   def create
      @enquiry   = Enquiry.new(params[:enquiry])
  
    respond_to do |format|
      if @enquiry.save
        EnquiryMailer.enquiry_confirmation(@enquiry).deliver
        format.html { redirect_to root_path, notice: 'Enquiry was successfully sent.' }
        format.json { render json: new_enquiry_path, status: :created, location: @enquiry }
      else
        format.html { render action: "new" }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

end
