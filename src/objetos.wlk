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
	var property limite = 3
	
	method choqueConSnake() {
		snakeGame.reproducirSonido("eating-apple.wav")
		vecesComida += 1
		self.posicionAleatoria(1)
		serpiente.agregarParteACuerpo()
		if(vecesComida == limite){
			game.removeVisual(self)
			if(snakeGame.nivel().siguiente() != null) {
				hoyo.posicionAleatoria(2)
				game.addVisual(hoyo)
			}else {
				game.addVisual(nest)
			}
			
		}
	}
	
}


object pocionAzul inherits ObjetoAleatorio(image = "hoyo.png", position = game.at(27,14)) {
	
	/*override posicionAleatoria() {
		const direcciones = [arriba,abajo,derecha,izquierda]
		var posTentativas = []
		
		direcciones.forEach({ unaDireccion => posTentativas.add(posicionTentativa(unaDireccion)) })
		posTentativas.filter({ unaPosicion => self.puedoIr(unaPosicion) })
		position = posTentativas.first()
	}
	
	method posicionTentativa(unaDireccion) = unaDireccion.siguientePosicion(fruta.position())
	
	*/
	
	
	method choqueConSnake() {
		snakeGame.pocionAzulActivada(true)
		// Cambiar imagenCabeza e imagenCuerpo en direcciones
	}
}


object pocionRoja inherits ObjetoAleatorio(image = "hoyo.png", position = game.at(27,14)) {
	var property activada = false
	
	method choqueConSnake() {
		activada = true
		serpiente.detenerse()
		serpiente.comienzaAMoverse(150)
		// Cambiar imagenCabeza e imagenCuerpo en direcciones
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