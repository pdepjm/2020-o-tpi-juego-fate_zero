import wollok.game.*
import movimientos.*

object cabezaSnake {
	var position =  game.at(2, 2)
	//var imagen = "cabeza.png"
	
	method position() = position
	//method image() = imagen
	
	method moverseA(nuevaPosicion) {position = nuevaPosicion}
}

/*object cuerpoSnake {

	method choqueConSnake() { game.schedule(5000, {game.stop()}) }
}


*/
object frutilla {
	var movimiento = aleatorio
	var choques = 0
	
	method position() = movimiento.posicion()
	method image() = "frutilla.png"
	
	method choqueConSnake() {
		choques += 1
		if(choques < 5){
			movimiento.nuevaPosicion()
		}else {
			game.schedule(5000, {game.stop()})
		}
			
	}
}

object pared {
	method image() = "muro.png"
	method choqueConSnake() {}
}