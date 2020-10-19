import wollok.game.*
import objetos.*
import snakeGame.*
import direcciones.*
import muro.*
import posicionAleatoria.*

object cabezaSnake  {
	var position = game.at(2,2)
	var imagen = "cabeza-derecha.png"
	var direccion = derecha
	var cuerpo = []
	
	method position() = position
	method image() = imagen
	
	method moverseA(nuevaPosicion) {
		position = nuevaPosicion
		//cuerpo.apply({parteCuerpo => parteCuerpo.mover()})
	}
	
	/*method agregarCuerpo(){
		var parte = new CuerpoSnake(position = ultimo.position().left(1))
		cuerpo.add(parte)
		game.addVisual(parte)
		ultimo = parte
	}*/
	
									
	method cambiarImagen(unaImagen) {
		imagen = unaImagen
	}
	
	method direccionElegida(unaDireccion) {direccion = unaDireccion}
	
	method nuevaDireccionParaAvanzar() = direccion.siguientePosicion()
	
	method comienzaAMoverse() {
		game.onTick(300, "movimiento Snake", { self.moverseA(self.nuevaDireccionParaAvanzar()) })
	}
	
	
	method pasarDeNivel() { 
		game.removeVisual(self)
		snakeGame.over()
	}
	
}


class CuerpoSnake  {
	var  position
	
	method image() = "cuerpo.png"
	method position() = position
	
	/* 
	method mover(nuevaPosicion){
	ultimaPosicion = position
	if (anterior != null) 
		anterior.mover(ultimaPosicion)
	position = nuevaPosicion
	}*/
	
	method pasarDeNivel() { 
		game.removeVisual(self)
		snakeGame.over()
	}

}


// LA OTRA VERSION
/*
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
	

	 /////////////// anterior ->>> actual->>>> siguiente
	
	
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
 */