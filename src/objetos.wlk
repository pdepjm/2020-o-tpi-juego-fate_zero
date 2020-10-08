import wollok.game.*
import movimientos.*

object snake {
	var position =  game.at(2, 2)
	//var imagen = "snake.png"
	
	method position() = position
	//method image() = imagen
	
	method moverseA(nuevaPosicion) {position = nuevaPosicion}
}

class Fruta {
	var movimiento = aleatorio
	
	method position() = movimiento.posicion()
	//method image() = "fruta.png"
	
	method comidoPorSnake() {movimiento = comido}
}

object pared {
	
}