import wollok.game.*
import snakeGame.*


class muro{
	var property position
	var property image = "muro.png"
	
	method choqueConSnake() {
		snakeGame.over()
		}
}



object nivel {
	const ancho = game.width()
    const alto = game.height()
	var bordeLateral = []
	var bordeCentral = []

	method generarBordes() {
		var posCasillasLaterales = []
		var posCasillasCentrales = []
			(0 .. ancho-1).forEach{ i => posCasillasCentrales.add(new Position(x=i, y=0)) } // borde abajo
			(0 .. ancho-1).forEach{ i => posCasillasCentrales.add(new Position(x=i, y=alto-1)) } // borde arriba
			(1 .. alto-2).forEach{ i => posCasillasLaterales.add(new Position(x=0, y=i)) } // borde izquierdo
			(1 .. alto-2).forEach{ i => posCasillasLaterales.add(new Position(x=ancho-1, y=i)) } // borde derecho
			
			posCasillasLaterales.forEach { posicion => 
				var casilla = new muro(position = posicion)
				game.addVisual(casilla)
				bordeLateral.add(casilla)	
			}
			posCasillasCentrales.forEach { posicion => 
				var casilla = new muro(position = posicion)
				game.addVisual(casilla)
				bordeCentral.add(casilla)	
			}
		}
}




















