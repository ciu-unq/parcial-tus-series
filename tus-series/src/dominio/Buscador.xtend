package dominio

import java.util.List

class Buscador {
	List<Serie> series = newArrayList
	
	new() {
		bootstrap
	}
	
	def search(String search) {
		series.filter[nombre.contains(search)].toList
	}
	
	def crear(Serie serie) {
		series.add(serie)
	}
	
	def bootstrap() {
		crear(new Serie() => [
			nombre = "Grande Pa"
			temporadas = 5
			vistas = 1
		])
		crear(new Serie() => [
			nombre = "Cebollitas"
			temporadas = 3
			vistas = 2
		])
		crear(new Serie() => [
			nombre = "Chiquititas"
			temporadas = 9
			vistas = 3
		])
	}
}