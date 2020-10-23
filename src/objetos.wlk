import wollok.game.*
import snakeGame.*
import direcciones.*
import serpiente.*
import muro.*

class ObjetoAleatorio {
	var property image
	var property position
	
	method posicionAleatoria() {
		const x = 1.randomUpTo(game.width()-1).truncate(0)
		const y = 1.randomUpTo(game.height()-1).truncate(0)
		const posicionTentativa = game.at(x, y)
		if (self.puedoIrEn(posicionTentativa)) {
			position = posicionTentativa		
		} else {
			self.posicionAleatoria()
		}
	}
	
	method puedoIrEn(posicionTentativa) = true // posicionTentativa.allElements()
}


object fruta inherits ObjetoAleatorio(image = "manzana.png", position = game.at(8, 8)) {
	var vecesComida = 0
	
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



object hoyo inherits ObjetoAleatorio(image = "hoyo.png", position = game.at(27,14)) {
	
	method choqueConSnake() { // PASAR DE NIVEL
		nivel1.iniciar()
		game.removeVisual(self)
		game.addVisual(fruta)
	}
}