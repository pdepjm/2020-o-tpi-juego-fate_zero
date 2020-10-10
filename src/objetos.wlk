import wollok.game.*
import snakeGame.*
import direcciones.*

object cabezaSnake {
	var position = game.at(2, 2)
	var imagen = "jugador.png"
	var direccion = derecha
	
	method position() = position
	method image() = imagen
	
	method moverseA(nuevaPosicion) {position = nuevaPosicion}
	method direccionElegida(unaDireccion) {direccion = unaDireccion}
	method nuevaDireccionParaAvanzar() = direccion.siguientePosicion()
	
	method comienzaAMoverse() {
		game.onTick(200, "movimiento Snake", { self.moverseA(self.nuevaDireccionParaAvanzar()) })
	} 
}


/*class CuerpoSnake {
	method position() = cabezaSnake.position().left(1)
	method choqueConSnake() { 
		snakeGame.over()
	}
}
*/

object fruta {
	var posicion = game.at(8, 8)
	var choques = 0

	method position() = posicion
	method image() = "manzana.png"

	method nuevaPosicion() {
		const x = 0.randomUpTo(game.width()-1).truncate(0)
		const y = 0.randomUpTo(game.height()-1).truncate(0)
		posicion = game.at(x, y)
	}
	
	method choqueConSnake() {
		choques += 1
		if(choques < 3){
			self.nuevaPosicion()
		}else {
			game.removeVisual(self)
			snakeGame.over()
		}
			
	}
}

/*class Ladrillo {
	method image() = "muro.png"
	method choqueConSnake() {
		snakeGame.over()
	}
}*/

object gameOver {
	method position() = game.at(3,1)
	method image() = "game_over.png"
	method choqueConSnake() {}
}