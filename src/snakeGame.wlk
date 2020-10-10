import wollok.game.*
import objetos.*
import direcciones.*

object snakeGame {
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		game.start()
		cabezaSnake.comienzaAMoverse()
	}
	
	method configurarJuego() {
		game.title("Snake Game")
		game.width(16)
		game.height(10)
	}
	
	method agregarPersonajes() {
		game.addVisual(cabezaSnake)
		//game.addVisual(cuerpoSnake)
		game.addVisual(fruta)
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({cabezaSnake.direccionElegida(arriba)})
		keyboard.down().onPressDo({cabezaSnake.direccionElegida(abajo)})
		keyboard.left().onPressDo({cabezaSnake.direccionElegida(izquierda)})
		keyboard.right().onPressDo({cabezaSnake.direccionElegida(derecha)})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
		
	}
	
	method over() {
		game.addVisual(gameOver)
		game.schedule(5000, {game.stop()})
	}
}
