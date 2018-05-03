package vistas

import dominio.Serie
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class EditarSerieWindow extends CrearSerieWindow{
	
	new(WindowOwner parent, Serie serie) {
		super(parent, serie)
		title = "Editar serie"
		aceptarLabel = "Editar"
	}
	
	override protected crearPanelPrincipal(Panel panel) {
		super.createFormPanel(panel)
		crearLabelConTextbox(panel, "Vistas", "vistas", true)
	}
	
}
