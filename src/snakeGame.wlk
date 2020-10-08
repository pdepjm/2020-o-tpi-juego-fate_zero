import wollok.game.*
import movimientos.*
import objetos.*

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
		game.width(17)
		game.height(11)
		game.boardGround("fondo_arena.jpg")
	}
	
	method agregarPersonajes() {
		game.addVisual(cabezaSnake)
		//game.addVisual(cuerpoSnake)
		game.addVisual(frutilla)
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({cabezaSnake.moverseA(cabezaSnake.position().up(1))})
		keyboard.down().onPressDo({cabezaSnake.moverseA(cabezaSnake.position().down(1))})
		keyboard.left().onPressDo({cabezaSnake.moverseA(cabezaSnake.position().left(1))})
		keyboard.right().onPressDo({cabezaSnake.moverseA(cabezaSnake.position().right(1))})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, { visualColisionado => visualColisionado.choqueConSnake()})
	}
}
