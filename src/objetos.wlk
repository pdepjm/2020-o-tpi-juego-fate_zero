import wollok.game.*
import snakeGame.*
import direcciones.*
import titulosYfondos.*
import serpiente.*
import niveles.*

class ObjetoAleatorio {
	var property image
	var property position
	
	method posicionAleatoria(limite) {
		const x = limite.randomUpTo(game.width()-limite).truncate(0)
		const y = limite.randomUpTo(game.height()-limite).truncate(0)
		const posicionTentativa = game.at(x, y)
		if (self.puedoIrEn(posicionTentativa)) {
			position = posicionTentativa		
		} else {
			self.posicionAleatoria(limite)
		}
	}
	
	method puedoIrEn(posicionTentativa) = posicionTentativa.allElements().isEmpty()
}


object fruta inherits ObjetoAleatorio(image = "manzana.png", position = game.at(8, 8)) {
	var property vecesComida = 0
		
	method choqueConSnake() {
		snakeGame.reproducirSonido("eating-apple.wav")
		vecesComida += 1
		self.posicionAleatoria(1)
		serpiente.agregarParteACuerpo()
		if(vecesComida == 3){
			game.removeVisual(self)
			hoyo.posicionAleatoria(2)
			game.addVisual(hoyo)
		}
		if(vecesComida == 10){
			game.removeVisual(self)
			game.addVisual(nest)
		}
	}
}



object hoyo inherits ObjetoAleatorio(image = "hoyo.png", position = game.at(27,14)) {
		
	method choqueConSnake() {
		snakeGame.reproducirSonido("level-up.wav")
		serpiente.detenerse()
		game.removeVisual(self)
		snakeGame.jugando(false)
		snakeGame.pasarASiguienteNivel()
	}
}

object nest {
	method position() = game.at(15,1)
	method image() = "nest.png"
	
	method choqueConSnake() {
		snakeGame.win()
	}
}