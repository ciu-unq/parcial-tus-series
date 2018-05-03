package appmodels

import dominio.Buscador
import dominio.Serie
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class SeriesAppModel {
	Buscador home = new Buscador
	String busqueda = ""
	List<Serie> series
	Serie serieSeleccionada
	
	new() {
		buscar
	}
	
	def buscar() {
		series = home.search(busqueda)
	}
		
	def mas() {
		serieSeleccionada.aumentarVistas
	}
	
	def menos() {
		serieSeleccionada.disminuirVistas
	}
	
	def crearSerie(Serie serie) {
		home.crear(serie)
		busqueda = ""
		buscar
	}
	
}
