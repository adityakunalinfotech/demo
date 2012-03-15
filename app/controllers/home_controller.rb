class HomeController < ApplicationController
  def index
   @users     =    User.all
   @patients  =    Patient.all
   @vaidyas   =    Vaidya.all
   @hospitals =    Hospital.all
  end

  
  def new
    respond_to do |format|
      if    current_user.role?  :doctor
        d = current_user.vaidyas
        if d.empty?
          format.html { redirect_to new_vaidya_path, notice: 'Welcome.' }
        #format.json { render json: , status: :created, location: @vaidya }
        else
          format.html { redirect_to vaidyas_path, notice: 'Welcome doctor.' }
        end
      elsif current_user.role?  :patient
        p = current_user.patients
        if p.empty?
          format.html { redirect_to new_patient_path, notice: 'Welcome patient.' }
        #format.json { render json: , status: :created, location: @vaidya }
        else
          format.html { redirect_to patients_path, notice: 'Welcome patient.' }
        end
      else current_user.role?   :hospital
        h =current_user.hospitals
        if h.empty?
        format.html { redirect_to new_hospital_path, notice: 'Welcome.' }
        #format.json { render json: , status: :created, location: @vaidya }
        else
          format.html { redirect_to hospitals_path, notice: "Welcome" }
        end
      end
    end
  end
  def show
 
  end
end
