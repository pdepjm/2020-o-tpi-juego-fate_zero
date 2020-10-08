import wollok.game.*

object cabezaSnake {
	var position =  game.at(2, 2)
	//var imagen = "cabeza.png"
	
	method position() = position
	//method image() = imagen
	
	method moverseA(nuevaPosicion) {position = nuevaPosicion}
}

/*class CuerpoSnake {
	/*****************method posicion() = cabezaSnake.position().left(1)
	method choqueConSnake() { 
		game.say(game.center(),"GAME OVER")
		game.schedule(5000, {game.stop()})
	}
}


*/
object frutilla {
	var posicion = game.at(8, 8)
	var choques = 0

	method posicion() = posicion
	method image() = "frutilla.png"

	method nuevaPosicion() {
		const x = 0.randomUpTo(game.width()-1).truncate(0)
		const y = 0.randomUpTo(game.height()-1).truncate(0)
		posicion = game.at(x, y)
	}
	
	method choqueConSnake() {
		choques += 1
		if(choques < 5){
			self.nuevaPosicion()
		}else {
			game.say(game.center(),"GAME OVER")
			game.schedule(5000, {game.stop()})
		}
			
	}
}

object pared {
	method image() = "muro.png"
	method choqueConSnake() {
		game.say(game.center(),"GAME OVER")
		game.schedule(5000, {game.stop()})
	}
}