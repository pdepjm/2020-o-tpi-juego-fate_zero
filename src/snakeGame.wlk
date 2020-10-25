import wollok.game.*
import objetos.*
import direcciones.*
import niveles.*
import serpiente.*

object snakeGame {
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		serpiente.comienzaAMoverse(200)
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
		const nivel0 = new Nivel()
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
	
	method lost() {
		serpiente.detenerse()
		self.over()
	}
	
	method over() {
		const sonido = game.sound("game-over.wav")
		sonido.play()
		game.addVisual(gameOver)
		game.schedule(5000, {game.stop()})
	}
}
