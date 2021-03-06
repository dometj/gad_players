# encoding: UTF-8
class JugadorController < ApplicationController
  before_action :set_jugador, only: [:show, :edit, :update, :destroy]
  include JugadorHelper

  WARNING_MAS_CARACTERES_Y_LETRAS = 'Por favor ingresá una consulta con más de 2 caracteres y asegurate de utilizar sólo letras.'
  WARNING_SIN_RESULTADOS = 'No encontramos jugadores que coincidan con tu consulta. Por favor, revisá si no tipeaste mal.'
  WARNING_SIN_SIMILARES = 'No encontramos ningún jugador similar al que consultaste. Que raro'
  WARNING_JUGADOR_NO_EXISTE = 'Querés buscar similares a un jugador que no existe en nuestra base de datos'

  # GET /jugador
  # GET /jugador.json
  def index
  end

  # GET /jugador/search_by_similarity Ruta para ingresar búsquedas por similitud de atributos
  def search_by_similarity
    @jugador_consulta = Jugador.new
    render "search_by_similarity"
  end
  
  # GET /jugador/search para búsquedas por nombre
  def search
    # Mensaje de error en nil
    @warning_message = nil
    # Seteo la consulta por nombre
    @query_name = search_params
    # TODO controlar esto en las validaciones
    # Separo el string en palabras que tengan más de 2 letras, dejando sólamente letras
    querys = @query_name.scan(/[a-zA-Z][a-zA-Z][a-zA-Z]+/)
    if querys.empty? # O no ingresó nada o ingresó cualquier cosa menos letras
      @warning_message = WARNING_MAS_CARACTERES_Y_LETRAS
    else
      # Busco jugadores por nombre
      @jugadores_con_distancia = search_by_name querys
      if @jugadores_con_distancia.empty?
        @warning_message = WARNING_SIN_RESULTADOS
      end
    end
  end

  # POST jugador/search_by_similarity_attributes Ruta para realizar búsquedas por similitud de atributos
  def search_by_similarity_attributes
    # Mensaje de error en nil
    @warning_message = nil
    # Obtengo el jugador consultado
    jugador = Jugador.new jugador_params
    # String que muestro sobre qué consulta se realizó
    @jugador_consulta = 'Jugador personalizado'
    # Busco jugadores similares al jugador
    @jugadores_con_distancia = db_search_by_similarity_attributes jugador
    if @jugadores_con_distancia.empty?
      @warning_message = WARNING_SIN_SIMILARES
    end
    render "search"
  end

  # GET jugador/search_by_similarity/:id Ruta para búsquedas por similitud a un jugador
  def search_by_similarity_id
    # Mensaje de error en nil
    @warning_message = nil
    # Seteo el id del jugador consulta
    jugador_id = search_by_similarity_id_params
    # Si existe busco los similares..
    if Jugador.exists? jugador_id
      @jugador_consulta = (Jugador.find jugador_id).nombre
      # Busco jugadores similares al jugador
      @jugadores_con_distancia = db_search_by_similarity jugador_id
      if @jugadores_con_distancia.empty?
        @warning_message = WARNING_SIN_SIMILARES
      end
    else
      # No existe el jugador, le erraste en la URL macho
      @warning_message = WARNING_JUGADOR_NO_EXISTE
    end
      render "search"
  end

  # GET /jugador/1
  # GET /jugador/1.json
  def show
    redirect_to jugador_index_path
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
    # setea un jugador a partir del parametro id
    def set_jugador
      @jugador = Jugador.find(params[:id])
    end

    # Parsea los parámetros de un jugador
    def jugador_params
      params.require(:jugador).permit(:nombre, :pais, :club, :posicion, :edad, :aceleracion, :agresividad, :agilidad, :anticipacion, :balance, :valentia, :compostura, :concentracion, :corners, :creatividad, :centro, :decision, :determinacion, :gambeta, :remate, :primer_toque, :instinto, :cabezazo, :influencia, :salto, :tiro_lejano, :pase_largo, :marca, :forma_fisica_natural, :juego_sin_pelota, :velocidad, :pases, :penales, :posicionamiento, :tiros_libres, :resistencia, :fuerza, :entrada, :trabajo_en_equipo, :tecnica, :sacrificio, :porcentaje_atajadas, :unique_id, :pierna_derecha, :pierna_izquierda, :arquero, :libero, :lateral_derecho, :defensor_central, :lateral_izquierdo, :carrilero_derecho, :carrilero_izquierdo, :mediocampista_defensivo, :mediocampista_derecho, :mediocampista_central, :mediocampista_izquierdo, :mediapunta_derecho, :mediapunta_central, :mediapunta_izquierdo, :delantero, :fr, :ts_rating, :fs_rating, :dc_rating, :habilidad_actual, :altura, :peso)
    end
    
    # Parseo los parametros de GET jugador/search/:name
    def search_params
      # TODO Configurar acá la variable params
      params[:query_name]
    end

    def search_by_similarity_id_params
      # TODO Configurar acá la variable params
      params[:id]
    end

    # Búsqueda por nombre que contengan dicho string como substring (no case sensitive)
    def search_by_name querys
      # Inicializo la expresión regular de consulta
      query_regexp = ''
      # Construyo la expresión regular de consulta
      querys.each do |query_name|
        query_regexp += '(?=.*'+query_name+')' 
      end
      # Busco jugadores que cuyo nombre cumpla con la expresión regular (no case sensitive)
      Jugador.where 'nombre ~* ?', query_regexp
    end

    # Búsqueda por similitud a partir del id de un jugador en particular
    def db_search_by_similarity jugador_id
      #armo el string SQL para la consulta
      string_consulta = 'SELECT busqueda_por_similitud_by_id('+jugador_id+');'
      
      #realizo la consulta (devuelve pares de id-distancia)
      id_jugadores_resultantes_con_distancia = ActiveRecord::Base.connection.send(:select_all, string_consulta).rows


      # creo la lista de jugadores y distancia
      lista_jugadores_con_distancia = Array.new
      es_jugador = true
      jugador = nil

      id_jugadores_resultantes_con_distancia.each do | jugador_distancia |
        if es_jugador
          jugador = Jugador.find jugador_distancia
          es_jugador = false
        else
          lista_jugadores_con_distancia.push([jugador, jugador_distancia])
          es_jugador = true
        end
      end

      lista_jugadores_con_distancia
    end

    # Búsqueda por similitud a partir de los atributos de un jugador ficticio
    def db_search_by_similarity_attributes jugador
      # convierto el jugador a un string con el formato de arrays de postgresql
      jugador_string = toString jugador

      #armo el string SQL para la consulta
      string_consulta = 'SELECT busqueda_por_similitud_atributos('+jugador_string+');'

      #realizo la consulta (devuelve pares de id-distancia)
      id_jugadores_resultantes_con_distancia = ActiveRecord::Base.connection.send(:select_all, string_consulta).rows

      # creo la lista de jugadores y distancia
      lista_jugadores_con_distancia = Array.new
      es_jugador = true

      id_jugadores_resultantes_con_distancia.each do | jugador_distancia |
        if es_jugador
          jugador = Jugador.find jugador_distancia
          es_jugador = false
        else
          lista_jugadores_con_distancia.push([jugador, jugador_distancia])
          es_jugador = true
        end
      end

      lista_jugadores_con_distancia
    end
end
