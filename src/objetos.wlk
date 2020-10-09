import wollok.game.*
import snakeGame.*
import direcciones.*

object cabezaSnake {
	var position =  game.at(2, 2)
	var imagen = "manzana.png"
	
	method position() = position
	method image() = imagen
	
	method moverseA(unaDireccion) {
		position = self.direccionarHacia(unaDireccion)
	}
	method direccionarHacia(unaDireccion) = game.onTick(200, "movimientoSnake", { => unaDireccion.siguientePosicion() })
}


/*class CuerpoSnake {
	method position() = cabezaSnake.position().left(1)
	method choqueConSnake() { 
		game.over()
	}
}
*/

object fruta {
	var posicion = game.at(8, 8)
	var choques = 0

	method position() = posicion
	method image() = "frutilla.png"

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