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
		series = #[] //Workaround: Actualización forzada para que se vean los cambios de mas y menos en una serie nueva
		series = home.search(busqueda)
	}
		
	def mas() {
		serieSeleccionada.aumentarVistas
		buscar
	}
	
	def menos() {
		serieSeleccionada.disminuirVistas
		buscar
	}
	
	def crearSerie(Serie serie) {
		serie.validar
		home.crear(serie)
		busqueda = ""
		buscar
	}
	
	def editarSerie() {
		serieSeleccionada.validar
	}
	
}
