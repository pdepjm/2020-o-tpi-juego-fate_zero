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
		keyboard.up().onPressDo({cabezaSnake.moverseA(direccArriba)})
		keyboard.down().onPressDo({cabezaSnake.moverseA(direccAbajo)})
		keyboard.left().onPressDo({cabezaSnake.moverseA(direccIzquierda)})
		keyboard.right().onPressDo({cabezaSnake.moverseA(direccDerecha)})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
	}
	
	method over() {
		game.addVisual(gameOver)
		game.schedule(5000, {game.stop()})
	}
}
