require 'test_helper'

class JugadorControllerTest < ActionController::TestCase
  setup do
    @jugador = jugador(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jugador)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jugador" do
    assert_difference('Jugador.count') do
      post :create, jugador: { aceleracion: @jugador.aceleracion, agilidad: @jugador.agilidad, agresividad: @jugador.agresividad, altura: @jugador.altura, anticipacion: @jugador.anticipacion, arquero: @jugador.arquero, balance: @jugador.balance, cabezazo: @jugador.cabezazo, carrilero_derecho: @jugador.carrilero_derecho, carrilero_izquierdo: @jugador.carrilero_izquierdo, centro: @jugador.centro, club: @jugador.club, compostura: @jugador.compostura, concentracion: @jugador.concentracion, corners: @jugador.corners, creatividad: @jugador.creatividad, dc_rating: @jugador.dc_rating, decision: @jugador.decision, defensor_central: @jugador.defensor_central, delantero: @jugador.delantero, determinacion: @jugador.determinacion, edad: @jugador.edad, entrada: @jugador.entrada, forma_fisica_natural: @jugador.forma_fisica_natural, fr: @jugador.fr, fs_rating: @jugador.fs_rating, fuerza: @jugador.fuerza, gambeta: @jugador.gambeta, habilidad_actual: @jugador.habilidad_actual, influencia: @jugador.influencia, instinto: @jugador.instinto, juego_sin_pelota: @jugador.juego_sin_pelota, lateral_derecho: @jugador.lateral_derecho, lateral_izquierdo: @jugador.lateral_izquierdo, libero: @jugador.libero, marca: @jugador.marca, mediapunta_central: @jugador.mediapunta_central, mediapunta_derecho: @jugador.mediapunta_derecho, mediapunta_izquierdo: @jugador.mediapunta_izquierdo, mediocampista_central: @jugador.mediocampista_central, mediocampista_defensivo: @jugador.mediocampista_defensivo, mediocampista_derecho: @jugador.mediocampista_derecho, mediocampista_izquierdo: @jugador.mediocampista_izquierdo, nombre: @jugador.nombre, pais: @jugador.pais, pase_largo: @jugador.pase_largo, pases: @jugador.pases, penales: @jugador.penales, peso: @jugador.peso, pierna_derecha: @jugador.pierna_derecha, pierna_izquierda: @jugador.pierna_izquierda, porcentaje_atajadas: @jugador.porcentaje_atajadas, posicion: @jugador.posicion, posicionamiento: @jugador.posicionamiento, primer_toque: @jugador.primer_toque, remate: @jugador.remate, resistencia: @jugador.resistencia, sacrificio: @jugador.sacrificio, salto: @jugador.salto, tecnica: @jugador.tecnica, tiro_lejano: @jugador.tiro_lejano, tiros_libres: @jugador.tiros_libres, trabajo_en_equipo: @jugador.trabajo_en_equipo, ts_rating: @jugador.ts_rating, unique_id: @jugador.unique_id, valentia: @jugador.valentia, velocidad: @jugador.velocidad }
    end

    assert_redirected_to jugador_path(assigns(:jugador))
  end

  test "should show jugador" do
    get :show, id: @jugador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jugador
    assert_response :success
  end

  test "should update jugador" do
    patch :update, id: @jugador, jugador: { aceleracion: @jugador.aceleracion, agilidad: @jugador.agilidad, agresividad: @jugador.agresividad, altura: @jugador.altura, anticipacion: @jugador.anticipacion, arquero: @jugador.arquero, balance: @jugador.balance, cabezazo: @jugador.cabezazo, carrilero_derecho: @jugador.carrilero_derecho, carrilero_izquierdo: @jugador.carrilero_izquierdo, centro: @jugador.centro, club: @jugador.club, compostura: @jugador.compostura, concentracion: @jugador.concentracion, corners: @jugador.corners, creatividad: @jugador.creatividad, dc_rating: @jugador.dc_rating, decision: @jugador.decision, defensor_central: @jugador.defensor_central, delantero: @jugador.delantero, determinacion: @jugador.determinacion, edad: @jugador.edad, entrada: @jugador.entrada, forma_fisica_natural: @jugador.forma_fisica_natural, fr: @jugador.fr, fs_rating: @jugador.fs_rating, fuerza: @jugador.fuerza, gambeta: @jugador.gambeta, habilidad_actual: @jugador.habilidad_actual, influencia: @jugador.influencia, instinto: @jugador.instinto, juego_sin_pelota: @jugador.juego_sin_pelota, lateral_derecho: @jugador.lateral_derecho, lateral_izquierdo: @jugador.lateral_izquierdo, libero: @jugador.libero, marca: @jugador.marca, mediapunta_central: @jugador.mediapunta_central, mediapunta_derecho: @jugador.mediapunta_derecho, mediapunta_izquierdo: @jugador.mediapunta_izquierdo, mediocampista_central: @jugador.mediocampista_central, mediocampista_defensivo: @jugador.mediocampista_defensivo, mediocampista_derecho: @jugador.mediocampista_derecho, mediocampista_izquierdo: @jugador.mediocampista_izquierdo, nombre: @jugador.nombre, pais: @jugador.pais, pase_largo: @jugador.pase_largo, pases: @jugador.pases, penales: @jugador.penales, peso: @jugador.peso, pierna_derecha: @jugador.pierna_derecha, pierna_izquierda: @jugador.pierna_izquierda, porcentaje_atajadas: @jugador.porcentaje_atajadas, posicion: @jugador.posicion, posicionamiento: @jugador.posicionamiento, primer_toque: @jugador.primer_toque, remate: @jugador.remate, resistencia: @jugador.resistencia, sacrificio: @jugador.sacrificio, salto: @jugador.salto, tecnica: @jugador.tecnica, tiro_lejano: @jugador.tiro_lejano, tiros_libres: @jugador.tiros_libres, trabajo_en_equipo: @jugador.trabajo_en_equipo, ts_rating: @jugador.ts_rating, unique_id: @jugador.unique_id, valentia: @jugador.valentia, velocidad: @jugador.velocidad }
    assert_redirected_to jugador_path(assigns(:jugador))
  end

  test "should destroy jugador" do
    assert_difference('Jugador.count', -1) do
      delete :destroy, id: @jugador
    end

    assert_redirected_to jugador_index_path
  end
end
