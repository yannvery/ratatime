class TrackersController < ApplicationController
  before_action :require_login
  before_action :set_tracker, only: [:edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :new, :create]

  # GET /trackers
  # GET /trackers.json
  def index
    @project_charts = ProjectChart.for(user: current_user, date: Date.today)
    @trackers = Tracker.by_user(current_user).by_logged_date.all
    @tracker = Tracker.new
  end

  # GET /trackers/new
  def new
    @tracker = Tracker.new
  end

  # GET /trackers/1/edit
  def edit
    authorize @tracker
  end

  # POST /trackers
  # POST /trackers.json
  def create
    @tracker = Tracker.new(tracker_params.merge(user: current_user))
    respond_to do |format|
      if @tracker.save
        format.html { redirect_to trackers_url, notice: 'Tracker was successfully created.' }
        format.json { render :show, status: :created, location: @tracker }
      else
        format.html { render :new }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trackers/1
  # PATCH/PUT /trackers/1.json
  def update
    authorize @tracker
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to trackers_url, notice: 'Tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1
  # DELETE /trackers/1.json
  def destroy
    authorize @tracker
    @tracker.destroy
    respond_to do |format|
      format.html { redirect_to trackers_url, notice: 'Tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tracker
    @tracker = Tracker.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tracker_params
    params.fetch(:tracker, {}).permit(:duration, :description, :project_id, :logged_date)
  end
end
