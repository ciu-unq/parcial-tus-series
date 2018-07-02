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
		if (vistas == temporadas)
			throw new UserException("La cantidad vista no puede superar a las temporadas")
		setVistas(vistas + 1)
	}
	
	def disminuirVistas() {
		if (vistas == 0)
			throw new UserException("La cantidad vista no puede ser negativo")
		setVistas(vistas - 1)
	}
	
	def getPorcentajeVisto() {
		100 * vistas / temporadas
	}
	
	def void validar() {
		if (nombre === null || nombre.empty)
			throw new UserException("Debe tener un nombre")
		if (temporadas === null || temporadas <= 0 ) 
			throw new UserException("Debe tener alguna temporada")
		if (vistas === null || vistas < 0 || vistas > temporadas)
			throw new UserException("La cantidad vista debe ser un número entre cero y la cantidad de temporadas")
	}
}