import wollok.game.*
import snakeGame.*
import objetos.*
import direcciones.*
import niveles.*
import serpiente.*

class Panel {
	const property position = game.at(0,0)
	var property image
	
	method pasarDeNivel() {
		if(not snakeGame.jugando()){
			game.removeVisual(self)
			serpiente.comienzaAMoverse(200)
			snakeGame.jugando(true)
		}
	}
	
	method reiniciarNivel() {
		game.removeVisual(self)
		serpiente.reiniciar()
		serpiente.comienzaAMoverse(200)
		snakeGame.jugando(true)
		if(snakeGame.nivel() == "nivel1") {
			fruta.vecesComida(0)
		}
		if(snakeGame.nivel() == "nivel2") {
			fruta.vecesComida(3)
		}
	}
	
}

object start inherits Panel(image = "start.png") {
	override method pasarDeNivel() {
		super()
		snakeGame.panel(level1)
	}
}

object level1 inherits Panel(image = "level-1.png") {
	/*override method pasarDeNivel() {
		super()
		snakeGame.panel(level2)
		snakeGame.nivel(nivel2)
	} */
}
/*

object level2 inherits Panel(image = "level-2.png") {
	override method pasarDeNivel() {
		super()
		snakeGame.panel(level3)
		snakeGame.nivel(nivel3)
	}
}

object level3 inherits Panel(image = "level-3.png") {
	override method pasarDeNivel() {
		super()
		snakeGame.panel(youWon)
	}
}
*/


object youLost inherits Panel(image = "you-lost.png") { }

object youWon {
	method position() = game.at(0,0)
	method image() = "you-won.png"
	
}