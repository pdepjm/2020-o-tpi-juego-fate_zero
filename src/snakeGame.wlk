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
		cabezaSnake.comienzaAMoverse()
		game.start()
	}
	
	method configurarJuego() {
		game.title("Snake Game")
		game.width(30)
		game.height(18)
		game.cellSize(35)
	}
	
	method agregarPersonajes() {
		game.addVisual(cabezaSnake)
		game.addVisual(fruta)
		
		nivel0.iniciar()
		
		}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({cabezaSnake.direccionElegida(arriba)})
		keyboard.down().onPressDo({cabezaSnake.direccionElegida(abajo)})
		keyboard.left().onPressDo({cabezaSnake.direccionElegida(izquierda)})
		keyboard.right().onPressDo({cabezaSnake.direccionElegida(derecha)})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
		//game.whenCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
	}
	
	method over() {
		game.addVisual(gameOver)
		game.schedule(5000, {game.stop()})
	}
}
