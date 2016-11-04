class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index

  load_and_authorize_resource
  skip_authorize_resource only: :index

  # GET /things
  # GET /things.json
  def index
    @things = Thing.all
  end

  # GET /things/1
  # GET /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  # POST /things.json
  def create
    @thing = Thing.new(thing_params)

    respond_to do |format|
      if @thing.save
        if can? :read, @thing
          format.html { redirect_to @thing, notice: "#{@thing.name} was successfully created." }
          format.json { render :show, status: :created, location: @thing }
        else
          format.html { redirect_to things_path, notice: "#{@thing.name} was successfully created, but you aren't authorized to see it now." }
          format.json { render :index, status: :created, location: @thing }
        end
      else
        format.html { render :new }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /things/1
  # PATCH/PUT /things/1.json
  def update
    respond_to do |format|
      if @thing.update(thing_params)
        if can? :read, @thing
          format.html { redirect_to @thing, notice: "#{@thing.name} was successfully updated." }
          format.json { render :show, status: :created, location: @thing }
        else
          format.html { redirect_to things_path, notice: "#{@thing.name} was successfully updated, but for a truly Kafka-esque experience you aren't authorized to see it now, even though you just saw all the details of it." }
          format.json { render :index, status: :created, location: @thing }
        end
      else
        format.html { render :edit }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.json
  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url, notice: "#{@thing.name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      params.require(:thing).permit(:name)
    end
end
