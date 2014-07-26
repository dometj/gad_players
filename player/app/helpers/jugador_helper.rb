module JugadorHelper
	def toString jugador
		# comienza el array string
		jugador_string = 'ARRAY['

		# atributo 
		jugador_string += jugador.edad.to_s + ','

		# atributo 
		jugador_string += jugador.aceleracion.to_s + ','

		# atributo 
		jugador_string += jugador.agresividad.to_s + ','

		# atributo 
		jugador_string += jugador.agilidad.to_s + ','

		# atributo
		jugador_string += jugador.anticipacion.to_s + ','

		# atributo
		jugador_string += jugador.balance.to_s + ','

		# atributo
		jugador_string += jugador.valentia.to_s + ','

		# atributo
		jugador_string += jugador.compostura.to_s + ','

		# atributo
		jugador_string += jugador.concentracion.to_s + ','

		# atributo
		jugador_string += jugador.corners.to_s + ','

		# atributo
		jugador_string += jugador.creatividad.to_s + ','

		# atributo
		jugador_string += jugador.centro.to_s + ','

		# atributo
		jugador_string += jugador.decision.to_s + ','

		# atributo
		jugador_string += jugador.determinacion.to_s + ','

		# atributo
		jugador_string += jugador.gambeta.to_s + ','

		# atributo
		jugador_string += jugador.remate.to_s + ','

		# atributo
		jugador_string += jugador.primer_toque.to_s + ','

		# atributo
		jugador_string += jugador.instinto.to_s + ','

		# atributo
		jugador_string += jugador.cabezazo.to_s + ','

		# atributo
		jugador_string += jugador.influencia.to_s + ','

		# atributo
		jugador_string += jugador.salto.to_s + ','

		# atributo
		jugador_string += jugador.tiro_lejano.to_s + ','

		# atributo
		jugador_string += jugador.pase_largo.to_s + ','

		# atributo
		jugador_string += jugador.marca.to_s + ','

		# atributo
		jugador_string += jugador.forma_fisica_natural.to_s + ','

		# atributo
		jugador_string += jugador.juego_sin_pelota.to_s + ','

		# atributo
		jugador_string += jugador.velocidad.to_s + ','

		# atributo
		jugador_string += jugador.pases.to_s + ','

		# atributo
		jugador_string += jugador.penales.to_s + ','

		# atributo
		jugador_string += jugador.posicionamiento.to_s + ','

		# atributo
		jugador_string += jugador.tiros_libres.to_s + ','

		# atributo
		jugador_string += jugador.resistencia.to_s + ','

		# atributo
		jugador_string += jugador.fuerza.to_s + ','

		# atributo
		jugador_string += jugador.entrada.to_s + ','

		# atributo
		jugador_string += jugador.trabajo_en_equipo.to_s + ','

		# atributo
		jugador_string += jugador.tecnica.to_s + ','

		# atributo
		jugador_string += jugador.sacrificio.to_s + ','

		# atributo
		jugador_string += jugador.porcentaje_atajadas.to_s + ','

		# atributo
		jugador_string += jugador.pierna_derecha.to_s + ','

		# atributo
		jugador_string += jugador.pierna_izquierda.to_s + ','

		# atributo
		jugador_string += jugador.arquero.to_s + ','

		# atributo
		jugador_string += jugador.libero.to_s + ','

		# atributo
		jugador_string += jugador.lateral_derecho.to_s + ','

		# atributo
		jugador_string += jugador.defensor_central.to_s + ','

		# atributo
		jugador_string += jugador.lateral_izquierdo.to_s + ','

		# atributo
		jugador_string += jugador.carrilero_derecho.to_s + ','

		# atributo
		jugador_string += jugador.carrilero_izquierdo.to_s + ','

		# atributo
		jugador_string += jugador.mediocampista_defensivo.to_s + ','

		# atributo
		jugador_string += jugador.mediocampista_derecho.to_s + ','

		# atributo
		jugador_string += jugador.mediocampista_central.to_s + ','

		# atributo
		jugador_string += jugador.mediocampista_izquierdo.to_s + ','

		# atributo
		jugador_string += jugador.mediapunta_derecho.to_s + ','

		# atributo
		jugador_string += jugador.mediapunta_central.to_s + ','

		# atributo
		jugador_string += jugador.mediapunta_izquierdo.to_s + ','

		# atributo
		jugador_string += jugador.delantero.to_s

		# finalizo el array string
		jugador_string += ']'
		
		jugador_string
	end
end
