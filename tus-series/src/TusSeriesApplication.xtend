import org.uqbar.arena.Application
import vistas.SeriesWindow

class TusSeriesApplication extends Application{
	
	override protected createMainWindow() {
		new SeriesWindow(this)
	}
	
	def static void main(String[] args) {
		new TusSeriesApplication().start
	}
}