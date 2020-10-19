import wollok.game.*
import snakeGame.*
import direcciones.*
import posicionAleatoria.*

object cabezaSnake {
	var position = game.at(2,2)
	var imagen = "jugador.png"
	var direccion = derecha
	
	method position() = position
	method image() = imagen
	
	method moverseA(nuevaPosicion) {position = nuevaPosicion}
	
	method direccionElegida(unaDireccion) {direccion = unaDireccion}
	
	method nuevaDireccionParaAvanzar() = direccion.siguientePosicion()
	
	method comienzaAMoverse() {
		game.onTick(300, "movimiento Snake", { self.moverseA(self.nuevaDireccionParaAvanzar()) })
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
	var vecesComida = 0

	method position() = posicion
	method image() = "manzana.png"
	method posicionAleatoria(unaPosicion) {posicion = unaPosicion}
	
	method choqueConSnake() {
		vecesComida += 1
		if(vecesComida < 3){
			aleatoria.nuevaPosicion(self)
		}else {
			game.removeVisual(self)
			aleatoria.nuevaPosicion(hoyo)
			game.addVisual(hoyo)
			snakeGame.over()
		}
			
	}
}



object gameOver {
	method position() = game.at(7,1)
	method image() = "game_over.png"
	method choqueConSnake() {}
}

object hoyo {
	var posicion = game.at(27,14)
	
	method position() = posicion
	method image() = "hoyo3D.png"
	method posicionAleatoria(unaPosicion) {posicion = unaPosicion}
	
	method choqueConSnake() {
		 game.say(hoyo,"hola, georgie...")
	}
}