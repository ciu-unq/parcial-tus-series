package vistas

import appmodels.SeriesAppModel
import dominio.Serie
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class SeriesWindow extends SimpleWindow<SeriesAppModel> {

	new(WindowOwner parent) {
		super(parent, new SeriesAppModel)
		title = "Tus Series"
	}

	override protected createFormPanel(Panel mainPanel) {
		crearBuscador(mainPanel)
		crearTabla(mainPanel)
	}

	def crearBuscador(Panel mainPanel) {
		val panel = new Panel(mainPanel) => [layout = new HorizontalLayout]

		new TextBox(panel) => [
			value <=> "busqueda"
			width = 160
		]

		new Button(panel) => [
			caption = "Buscar"
			onClick [this.modelObject.buscar]
			setAsDefault
		]
	}

	def crearTabla(Panel mainPanel) {
		val panel = new Panel(mainPanel)

		val tabla = new Table(panel, Serie) => [
			items <=> "series"
			value <=> "serieSeleccionada"
			numberVisibleRows = 5
		]

		new Column(tabla) => [
			title = "Nombre"
			bindContentsToProperty("nombre")
		]
		new Column(tabla) => [
			title = "Temporadas"
			bindContentsToProperty("temporadas")
		]
		new Column(tabla) => [
			title = "Vistas"
			bindContentsToProperty("vistas")
		]
		new Column(tabla) => [
			title = "%"
			bindContentsToProperty("porcentajeVisto").transformer = [Integer porcentaje | '''«porcentaje» %''']
		]
	}

	override protected addActions(Panel panel) {
		val notNullSeleccionada = new NotNullObservable(modelObject, "serieSeleccionada")
		
		new Button(panel) => [
			caption = "-"
			onClick [this.modelObject.menos]
			bindEnabled(notNullSeleccionada)
		]

		new Button(panel) => [
			caption = "+"
			onClick [this.modelObject.mas]
			bindEnabled(notNullSeleccionada)
		]

		new Button(panel) => [
			caption = "Nueva"
			onClick [nuevaSerie]
		]

		new Button(panel) => [
			caption = "Editar"
			onClick [editarSerie]
			bindEnabled(notNullSeleccionada)
		]
	}

	def nuevaSerie() {
		val nuevaSerie = new Serie
		new CrearSerieWindow(this, nuevaSerie) => [
			onAccept[this.modelObject.crearSerie(nuevaSerie)]
			open
		]
	}

	def editarSerie() {
		new EditarSerieWindow(this, modelObject.serieSeleccionada) => [
			open
		]
	}

}
