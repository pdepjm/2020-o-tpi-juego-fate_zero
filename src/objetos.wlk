import wollok.game.*
import snakeGame.*
import direcciones.*
import serpiente.*
import muro.*

object fruta {
	var posicion = game.at(8, 8)
	var vecesComida = 0

	method position() = posicion
	method image() = "manzana.png"
	
	method posicionAleatoria() {
		const x = 1.randomUpTo(game.width()-1).truncate(0)
		const y = 1.randomUpTo(game.height()-1).truncate(0)
		posicion = game.at(x, y)
	}
	
	method choqueConSnake() {
		vecesComida += 1
		self.posicionAleatoria()
		serpiente.agregarParteACuerpo()
		if(vecesComida == 3){
			game.removeVisual(self)
			hoyo.posicionAleatoria()
			game.addVisual(hoyo)
		}
	}
}



object gameOver {
	method position() = game.at(8,2)
	method image() = "game_over.png"
	method choqueConSnake() {}
}



object hoyo {
	var posicion = game.at(27,14)
	
	method position() = posicion
	method image() = "hoyo.png"
	
	method posicionAleatoria() {
		const x = 0.randomUpTo(game.width()-1).truncate(0)
		const y = 0.randomUpTo(game.height()-1).truncate(0)
		posicion = game.at(x, y)
	}
	
	method choqueConSnake() { // PASAR DE NIVEL
		//serpiente.cuerpo().apply({unaParte => unaParte.desaparecer()})
		nivel1.iniciar()
		game.removeVisual(self)
		game.addVisual(fruta)
	}
}