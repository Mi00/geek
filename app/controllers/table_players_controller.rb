class TablePlayersController < ApplicationController
  before_action :set_table_player, only: [:show, :edit, :update, :destroy]

  # GET /table_players
  # GET /table_players.json
  def index
    @table_players = TablePlayer.all
  end

  # GET /table_players/1
  # GET /table_players/1.json
  def show
  end

  # GET /table_players/new
  def new
    @table_player = TablePlayer.new

  end

  # GET /table_players/1/edit
  def edit
  end

  # POST /table_players
  # POST /table_players.json
  def create
    @table = Table.find(params[:table_id])
    @event = @table.event_id
    @table_player = @table.table_players.new(table_id: params[:table_id], user_id: current_user.id)


    respond_to do |format|
      if @table_player.save
        format.html { redirect_to event_path(@event), notice: 'Table player was successfully created.' }
        format.json { render :show, status: :created, location: @table_player }
      else
        format.html { render :new }
        format.json { render json: @table_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /table_players/1
  # PATCH/PUT /table_players/1.json
  def update
    respond_to do |format|
      if @table_player.update(table_player_params)
        format.html { redirect_to @table_player, notice: 'Table player was successfully updated.' }
        format.json { render :show, status: :ok, location: @table_player }
      else
        format.html { render :edit }
        format.json { render json: @table_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_players/1
  # DELETE /table_players/1.json
  def destroy
    @event = @table_player.table.event
    @table_player.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: 'Table player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table_player
      @table_player = TablePlayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_player_params
      params.require(:table_player).permit(:user_id, :table_id)
    end
end
