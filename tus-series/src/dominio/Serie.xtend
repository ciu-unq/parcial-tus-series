package dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@Accessors
@TransactionalAndObservable
class Serie {
	String nombre
	Integer temporadas
	Integer vistas = 0
	
	def aumentarVistas() {
		setVistas(vistas + 1)
	}
	
	def disminuirVistas() {
		setVistas(vistas - 1)
	}
	
	def getPorcentajeVisto() {
		100 * vistas / temporadas
	}
	
	def void setTemporadas(Integer cant) {
		if (cant <= 0 ) throw new UserException("Debe tener alguna temporada")

		temporadas = cant
		setVistas(vistas) //Re-settear para checkear validaciones 
	}
	
	def void setVistas(Integer cant) {
		if (cant < 0 ) throw new UserException("La cantidad vista no puede ser negativa")
		if (cant > temporadas ) throw new UserException("No puede tener más vistas que el total de temporadas")

		vistas = cant
	}
}