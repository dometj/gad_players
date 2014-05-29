class JugadorController < ApplicationController
  before_action :set_jugador, only: [:show, :edit, :update, :destroy]

  # GET /jugador
  # GET /jugador.json
  def index
    
  end
  
  # GET /jugador/search/:query_name
  def search
    # Muestro 3 jugadores provisorios
    @jugador = Jugador.find 3,4,5
  end

  # GET /jugador/1
  # GET /jugador/1.json
  def show
  end

  # GET /jugador/new
  def new
    @jugador = Jugador.new
  end

  # GET /jugador/1/edit
  def edit
  end

  # POST /jugador
  # POST /jugador.json
  def create
    @jugador = Jugador.new(jugador_params)

    respond_to do |format|
      if @jugador.save
        format.html { redirect_to @jugador, notice: 'Jugador was successfully created.' }
        format.json { render action: 'show', status: :created, location: @jugador }
      else
        format.html { render action: 'new' }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jugador/1
  # PATCH/PUT /jugador/1.json
  def update
    respond_to do |format|
      if @jugador.update(jugador_params)
        format.html { redirect_to @jugador, notice: 'Jugador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @jugador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jugador/1
  # DELETE /jugador/1.json
  def destroy
    @jugador.destroy
    respond_to do |format|
      format.html { redirect_to jugador_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jugador
      @jugador = Jugador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jugador_params
      params.require(:jugador).permit(:nombre, :pais, :club, :posicion, :edad, :aceleracion, :agresividad, :agilidad, :anticipacion, :balance, :valentia, :compostura, :concentracion, :corners, :creatividad, :centro, :decision, :determinacion, :gambeta, :remate, :primer_toque, :instinto, :cabezazo, :influencia, :salto, :tiro_lejano, :pase_largo, :marca, :forma_fisica_natural, :juego_sin_pelota, :velocidad, :pases, :penales, :posicionamiento, :tiros_libres, :resistencia, :fuerza, :entrada, :trabajo_en_equipo, :tecnica, :sacrificio, :porcentaje_atajadas, :unique_id, :pierna_derecha, :pierna_izquierda, :arquero, :libero, :lateral_derecho, :defensor_central, :lateral_izquierdo, :carrilero_derecho, :carrilero_izquierdo, :mediocampista_defensivo, :mediocampista_derecho, :mediocampista_central, :mediocampista_izquierdo, :mediapunta_derecho, :mediapunta_central, :mediapunta_izquierdo, :delantero, :fr, :ts_rating, :fs_rating, :dc_rating, :habilidad_actual, :altura, :peso)
    end
    
    # Parseo los parametros de GET jugador/search/:name
    def search_params
      # Configurar acá la variable params
    end
end
