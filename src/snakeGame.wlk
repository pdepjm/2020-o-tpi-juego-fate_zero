import wollok.game.*
import objetos.*
import direcciones.*
import muro.*
import serpiente.*

object snakeGame {
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		serpiente.comienzaAMoverse()
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
		nivel0.iniciar()
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({serpiente.direccionElegida(arriba)})
		keyboard.down().onPressDo({serpiente.direccionElegida(abajo)})
		keyboard.left().onPressDo({serpiente.direccionElegida(izquierda)})
		keyboard.right().onPressDo({serpiente.direccionElegida(derecha)})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
	}
	
	method over() {
		game.addVisual(gameOver)
		game.schedule(5000, {game.stop()})
	}
}
