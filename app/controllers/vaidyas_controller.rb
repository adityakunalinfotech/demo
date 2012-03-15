class VaidyasController < ApplicationController
  # include VaidyasHelper
  def new
    @vaidya= Vaidya.new
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vaidya }
     end
  end

  def index
    @vaidya = Vaidya.find_by_user_id(params[:id])
    @vaidyas = Vaidya.all
  end

  def show
    @vaidya = Vaidya.find_by_id(params[:id])
    @enquiry = Enquiry.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vaidya }
    end
  end

  def edit
       @vaidya = Vaidya.find_by_user_id(params[:id])
  end
  def update
    @vaidya = Vaidya.find(params[:id])
       respond_to do |format|
       if @vaidya.update_attributes(params[:vaidya])
          format.html { redirect_to vaidyas_path, notice: 'Doctor was successfully updated.' }
          format.json { head k }
       else
          format.html { render action: "edit" }
          format.json { render json: @vaidya.errors, status: :unprocessable_entity }
       end
    end
  end
  def create
    @vaidya = Vaidya.new(params[:vaidya])

    respond_to do |format|
      if @vaidya.save
        format.html { redirect_to vaidyas_path, notice: 'Doctor was successfully created.' }
        format.json { render json: vaidyas_path, status: :created, location: @vaidya }
      else
        format.html { render action: "new" }
        format.json { render json: @vaidya.errors, status: :unprocessable_entity }
      end
    end
  end

end
