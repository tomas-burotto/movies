class WatchedsController < ApplicationController
  before_action :set_watched, only: [:show, :update, :destroy]
  before_action :check_login_admin, only: [:index, :show, :update, :destroy]
  before_action :check_login, only: [:create, :owns]

  #GET /desireds/user
  def owns
    @watcheds = current_user.watcheds

    render json: @watcheds
  end 

  # GET /watcheds
  def index
    @watcheds = Watched.all

    render json: @watcheds
  end

  # GET /watcheds/1
  def show
    render json: @watched
  end

  # POST /watcheds
  def create
    data = watched_params
    data["user_id"] = current_user.id
    @watched = Watched.new(data)

    if @watched.save
      render json: @watched, status: :created, location: @watched
    else
      render json: @watched.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watcheds/1
  def update
    if @watched.update(watched_params)
      render json: @watched
    else
      render json: @watched.errors, status: :unprocessable_entity
    end
  end

  # DELETE /watcheds/1
  def destroy
    @watched.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watched
      @watched = Watched.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def watched_params
      params.require(:watched).permit(:imdbid, :name, :description, :score, :image, :comment)
    end
end
