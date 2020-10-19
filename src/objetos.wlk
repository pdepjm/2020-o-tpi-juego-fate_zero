import wollok.game.*
import snakeGame.*
import direcciones.*
import posicionAleatoria.*

object cabezaSnake  {
	var position = game.at(2,2)
	var imagen = "jugador.png"
	var direccion = derecha
	var ultimo = self
	var cuerpo =[]
	
	method position() = position
	method image() = imagen
	
	method moverseA(nuevaPosicion) {
		var posicionActual = position
		position = nuevaPosicion
		ultimo.mover(posicionActual)
	}
									
	
	method direccionElegida(unaDireccion) {direccion = unaDireccion}
	
	method nuevaDireccionParaAvanzar() = direccion.siguientePosicion()
	
	method comienzaAMoverse() {
		game.onTick(300, "movimiento Snake", { self.moverseA(self.nuevaDireccionParaAvanzar()) })
	}
	
	
	method agregarCuerpo(){
		var parte = new CuerpoSnake( dieccionCabeza = direccion,position = ultimo.position().left(1))
		cuerpo.add(parte)
		game.addVisual(parte)
		ultimo = parte
	}
	
	
}


class CuerpoSnake  {
	
	var property dieccionCabeza
	var property position
	var siguiente = null
	var anterior = null
	var ultimaPosicion = null
	var imagen = "jugador.png"
	
	/*
	 *  anterior ->>> actual->>>> siguiente
	 * 
	 */
	method image() = imagen
	
	
	method position() = position
	
	
		method mover(nuevaPosicion){
		ultimaPosicion = position
		if (anterior != null) 
			anterior.mover(ultimaPosicion)
		position = nuevaPosicion
	}
	
	method choqueConSnake() { 
		snakeGame.over()
	}
	

}


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
		
		cabezaSnake.agregarCuerpo() // agrego el cuerpo
		
		
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