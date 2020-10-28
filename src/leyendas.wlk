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
object youWon inherits Panel(image = "you-won.png") {
	override method pasarDeNivel() {
		snakeGame.over()
	}
}

object youLost {
	method position() = game.at(0,0)
	method image() = "you-lost.png"
	
	method reiniciarNivel() {
		if(not snakeGame.jugando()){
			game.removeVisual(self)
			serpiente.comienzaAMoverse(200)
			snakeGame.jugando(true)
		}
	}
}