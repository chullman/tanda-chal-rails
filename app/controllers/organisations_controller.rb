class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.all

    @userOrganisation = Organisation.where(id: current_user.organisation_id).first
  end

  # GET /organisations/1
  # GET /organisations/1.json
  def show
  end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # GET /organisations/1/edit
  def edit
  end

  def join
    @user = User.find_by(id: current_user.id)

    if (@user.organisation_id.to_i != params[:id].to_i) #Prevents user from rejoining the organisation they're already a member of
      if @user.update(user_params)
        @user.update(organisation_id: params[:id])
      end
    end 

    

    redirect_to :root
  end

  def join_show
    @user = User.find_by(id: current_user.id)

    if (@user.organisation_id.to_i != params[:id].to_i) #Prevents user from rejoining the organisation they're already a member of
      if @user.update(user_params)
        @user.update(organisation_id: params[:id])
      end
    end 

    
    redirect_to :root
  end

  def leave
    @user = User.find_by(id: current_user.id)

    
    if @user.organisation_id.to_i == params[:id].to_i # Users can only leave an organisation that they are a member of
      if @user.update(user_params)
        @user.update(organisation_id: nil)
      end
    end

    redirect_to :root
  end

  def join_leave
    @user = User.find_by(id: current_user.id)

    
    if @user.organisation_id.to_i == params[:id].to_i # Users can only leave an organisation that they are a member of
      if @user.update(user_params)
        @user.update(organisation_id: nil)
      end
    end

    redirect_to :root
  end

  # POST /organisations
  # POST /organisations.json
  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Organisation was successfully created.' }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1
  # PATCH/PUT /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to @organisation, notice: 'Organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisations_url, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.permit(:organisation_id)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_organisation
      @organisation = Organisation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organisation_params
      params.require(:organisation).permit(:name, :hourly_rate)
    end
end
