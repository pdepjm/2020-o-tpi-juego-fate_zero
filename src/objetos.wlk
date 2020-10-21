import wollok.game.*
import snakeGame.*
import direcciones.*
import posicionAleatoria.*
import serpiente.*
import muro.*

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
			
			/*snakeGame.over()*/
			nivel1.iniciar()
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
	method image() = "hoyo.png"
	method posicionAleatoria(unaPosicion) {posicion = unaPosicion}
	
	method choqueConSnake() {}
}