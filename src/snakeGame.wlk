import wollok.game.*
import objetos.*
import direcciones.*
import leyendas.*
import niveles.*
import serpiente.*

object snakeGame {
	var property panel = start
	var property jugando = false
	
	
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
		const nivel0 = new Nivel()
		nivel0.iniciar()
	}
	
	method configurarTeclas() {
		keyboard.up().onPressDo({serpiente.direccionElegida(arriba)})
		keyboard.down().onPressDo({serpiente.direccionElegida(abajo)})
		keyboard.left().onPressDo({serpiente.direccionElegida(izquierda)})
		keyboard.right().onPressDo({serpiente.direccionElegida(derecha)})
		
		keyboard.enter().onPressDo({ panel.pasarDeNivel() })
		keyboard.q().onPressDo({
			if(not jugando)
				game.schedule(1000, {game.stop()})
		})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
	}
	
	method lost() {
		serpiente.detenerse()
		self.over()
	}
	
	method over() {
		self.reproducirSonido("game-over.wav")
		game.addVisual(gameOver)
		game.schedule(5000, {game.stop()})
	}
	
	method reproducirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.play()
	}
}
