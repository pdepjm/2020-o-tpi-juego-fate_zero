import wollok.game.*
import objetos.*
import direcciones.*
import leyendas.*
import niveles.*
import serpiente.*

object snakeGame {
	var property panel = start
	var property jugando = false
	var property nivel = "nivel1"
	
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		game.addVisual(panel)
		game.start()
	}
	
	method configurarJuego() {
		game.title("Snake Game")
		game.width(32)
		game.height(18)
		game.cellSize(35)
	}
	
	method agregarPersonajes() {
		serpiente.inicializar()
		game.addVisual(fruta)
		const nivel1 = new Nivel()
		nivel1.iniciar()
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({serpiente.direccionElegida(arriba)})
		keyboard.down().onPressDo({serpiente.direccionElegida(abajo)})
		keyboard.left().onPressDo({serpiente.direccionElegida(izquierda)})
		keyboard.right().onPressDo({serpiente.direccionElegida(derecha)})
		
		keyboard.enter().onPressDo({ panel.pasarDeNivel() })
		keyboard.x().onPressDo({ 
			if(not jugando)
				panel.reiniciarNivel()
		})
		keyboard.q().onPressDo({
			if(not jugando)
				game.schedule(1000, {game.stop()})
		})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
	}
	
	method reproducirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.play()
	}
	
	method mostrarNuevoPanel(nuevoPanel) {
		panel = nuevoPanel
		game.addVisual(panel)
	}
	
	
	
	method lost() {
		serpiente.detenerse()
		self.reproducirSonido("lose.wav")
		jugando = false
		self.mostrarNuevoPanel(youLost)
	}
	
	method win() {
		serpiente.detenerse()
		self.reproducirSonido("win.wav")
		game.addVisual(youWon)
		self.over()
	}
	
	method over() {
		game.schedule(5000, {game.stop()})
	}
}
