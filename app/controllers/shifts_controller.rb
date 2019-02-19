class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /shifts
  # GET /shifts.json
  def index
    @shifts = Shift.all
  end

  # GET /shifts/1
  # GET /shifts/1.json
  def show
  end

  # GET /shifts/new
  def new
    @shift = Shift.new
  end

  # GET /shifts/1/edit
  def edit
  end

  # POST /shifts
  # POST /shifts.json
  def create
    @shift = Shift.new(shift_params)
    
    if (user_signed_in?)
      @shift.user_id = current_user.id
    end

    if @shift.break_length.nil?
      @shift.break_length = 0
    end

    if (@shift.finish < @shift.start)

      respond_to do |format|
          format.html { redirect_to root_path, alert: 'Shift FINISH date and time can\'t be BEFORE the START date and time' }
          format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    elsif (((Time.parse(@shift.finish.to_s).to_time - Time.parse(@shift.start.to_s).to_time) / 3600) - (@shift.break_length.to_d / 60)) < 0
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Break time cannot be larger than the difference of the shift start and finish date and times' }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        if @shift.save
          format.html { redirect_to root_path, notice: 'Shift was successfully created.' }
          #format.json { render :show, status: :created, location: @shift }
        else
          format.html { render :new }
          format.json { render json: @shift.errors, status: :unprocessable_entity }
        end
      end
    end

 
  end

  # PATCH/PUT /shifts/1
  # PATCH/PUT /shifts/1.json
  def update
    respond_to do |format|
      if @shift.update(shift_params)
        format.html { redirect_to @shift, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shifts/1
  # DELETE /shifts/1.json
  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to shifts_url, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift
      @shift = Shift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_params
      params.require(:shift).permit(:start, :finish, :break_length)
    end
end
