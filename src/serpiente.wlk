import wollok.game.*
import objetos.*
import snakeGame.*
import direcciones.*
import muro.*

class CuerpoSnake {
	var property anterior
	var property siguiente
	var property image
	var property position
	var property posicionPrevia
	
	method desplazarseA(nuevaPosicion) {
		posicionPrevia = position
		position = nuevaPosicion
		if(siguiente != null){
			siguiente.moverseA(posicionPrevia)
		}
	}
	
	method moverseA(nuevaPosicion) {
		self.desplazarseA(nuevaPosicion)
		serpiente.direccion().cuerpoSegunDirecc(self)
	}
	
	method cambiarImagen(unaImagen) { image= unaImagen }
	
	method desaparecer() { game.removeVisual(self) }
	
}

object cabezaSnake inherits CuerpoSnake(anterior = null, siguiente = null, image = "cabeza-derecha.png", position = game.at(2,2), posicionPrevia = game.at(2,1)) {
	override method moverseA(nuevaPosicion) {
		self.desplazarseA(nuevaPosicion)
		serpiente.direccion().cabezaSegunDirecc()
	}
}

object serpiente {
	var cuerpo = [cabezaSnake]
	var direccion = derecha
	
	method cuerpo() = cuerpo
	method direccion() = direccion
	method direccionElegida(unaDireccion) { 
		if(unaDireccion != direccion.contraria()){
			direccion = unaDireccion
		}
	}
	method nuevaPosicionAAvanzar() = direccion.siguientePosicion()
	
	method agregarParteACuerpo() {
		var parte = new CuerpoSnake(anterior = cuerpo.last(), siguiente = null, image = "cuerpo.png", position = cuerpo.last().posicionPrevia(), posicionPrevia = null)
		cuerpo.last().siguiente(parte)
		cuerpo.add(parte)
		game.addVisual(parte)
	}
	
	method comienzaAMoverse() {
		game.onTick(250, "movimientoSnake", { cabezaSnake.moverseA(self.nuevaPosicionAAvanzar()) })
	}
	
	method detenerse() {
		game.removeTickEvent("movimientoSnake")
	}
	
	method inicializar() {
		game.addVisual(cabezaSnake)
		self.agregarParteACuerpo()
	}
}


