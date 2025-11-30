class CastlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_castle, only: %i[ show edit update destroy ]

  # GET /castles or /castles.json
  def index
    @castles = Castle.all
  end

  # GET /castles/1 or /castles/1.json
  def show
  end

  # GET /castles/new
  def new
    @castle = Castle.new
  end

  # GET /castles/1/edit
  def edit
  end

  # POST /castles or /castles.json
  def create
    @castle = Castle.new(castle_params)

    respond_to do |format|
      if @castle.save
        format.html { redirect_to @castle, notice: "Castle was successfully created." }
        format.json { render :show, status: :created, location: @castle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @castle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /castles/1 or /castles/1.json
  def update
    respond_to do |format|
      if @castle.update(castle_params)
        format.html { redirect_to @castle, notice: "Castle was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @castle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @castle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castles/1 or /castles/1.json
  def destroy
    @castle.destroy!

    respond_to do |format|
      format.html { redirect_to castles_path, notice: "Castle was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castle
      @castle = Castle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def castle_params
      params.require(:castle).permit(:name, :region, :description, :built_year, :image_url)
    end
end
