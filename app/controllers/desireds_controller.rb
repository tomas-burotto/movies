class DesiredsController < ApplicationController
  before_action :set_desired, only: [:show, :update, :destroy]
  before_action :check_login_admin, only: [:index, :show, :update, :destroy]
  before_action :check_login, only: [:create, :user]

  #GET /desireds/user
  def owns
    desireds = current_user.desireds

    render json: desireds
  end
  # GET /desireds
  def index
    @desireds = Desired.all

    render json: @desireds
  end

  # GET /desireds/1
  def show
    render json: @desired
  end

  # POST /desireds
  def create
    data = desired_params
    data["user_id"] = current_user.id
    @desired = Desired.new(data)

    if @desired.save
      render json: @desired, status: :created, location: @desired
    else
      render json: @desired.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /desireds/1
  def update
    if @desired.update(desired_params)
      render json: @desired
    else
      render json: @desired.errors, status: :unprocessable_entity
    end
  end

  # DELETE /desireds/1
  def destroy
    @desired.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desired
      @desired = Desired.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def desired_params
      params.require(:desired).permit(:imdbid, :name, :description, :score, :image, :comment)
    end
end
