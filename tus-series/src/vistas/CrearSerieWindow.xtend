package vistas

import dominio.Serie
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearSerieWindow extends TransactionalDialog<Serie>{
	protected String aceptarLabel
	
	new(WindowOwner parent, Serie serie) {
		super(parent, serie)
		title = "Nueva serie"
		aceptarLabel = "Crear"
	}
	
	override protected createFormPanel(Panel mainPanel) {
		val panel = new Panel(mainPanel).layout = new ColumnLayout(2)
		
		crearPanelPrincipal(panel)
	}
	
	def protected crearPanelPrincipal(Panel panel) {
		crearLabelConTextbox(panel, "Nombre", "nombre", false)
		crearLabelConTextbox(panel, "Temporadas", "temporadas", true)
	}
	
	override protected addActions(Panel panel) {
		new Button(panel) => [
			caption = aceptarLabel
			onClick [ this.accept ]
			setAsDefault
			disableOnError
		]
		
		new Button(panel) => [
			caption = "Cancelar"
			onClick [ this.cancel ]
		]
	}
	
	
	protected def TextBox crearLabelConTextbox(Panel panel, String label, String property, Boolean numeric) {
		new Label(panel) => [
			text = label
		]
		
		val field = if (numeric) new NumericField(panel, false) else new TextBox(panel)
		
		field => [
			value <=> property
			width = 140
		]
	}
}
