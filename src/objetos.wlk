import wollok.game.*
import snakeGame.*
import direcciones.*
import leyendas.*
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
	var vecesComida = 0
		
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
	}
}



object gameOver {
	method position() = game.at(9,2)
	method image() = "game_over.png"
	method choqueConSnake() {}
}



object hoyo inherits ObjetoAleatorio(image = "hoyo.png", position = game.at(27,14)) {
		
	method choqueConSnake() { // PASAR DE NIVEL
		snakeGame.reproducirSonido("level-up.wav")
		game.removeVisual(self)
		snakeGame.jugando(false)
		nivel1.iniciar()
		game.addVisual(level1)
	}
}