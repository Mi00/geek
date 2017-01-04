class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
  end

  # GET /tables/new
  def new
    @user = User.find(current_user.id)
    @game = @user.games.find(params[:game])
    @table = Table.new
    @events = Event.all
    if !params[:event_id].nil?
      @event = Event.find(params[:event_id])
    end
  end

  # GET /tables/1/edit
  def edit
    @user = User.find(current_user.id)
    @game = @user.games.find(params[:game])
    @events = Event.all
  end

  # POST /tables
  # POST /tables.json
  def create
    @user = User.find(current_user.id)
    @game = Game.find(params[:table][:game_id])
    @table = @game.tables.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to event_path(@table.event_id), notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to events_path, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @event = @table.event_id
    @table.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: 'Table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :owner, :game_id, :user_id, :event_id)
    end
end
