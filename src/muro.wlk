import wollok.game.*
import snakeGame.*
import serpiente.*


class Muro{
	var property position
	var property image = "muro.png"
	
	method choqueConSnake() {
		serpiente.detenerse()
		snakeGame.over()
	}
}



class Nivel {
	const ancho = game.width()
    const alto = game.height()
    
	var bordeLateral = []
	var bordeCentral = []
	
	var posCasillasLaterales = []
	var posCasillasCentrales = []
	
	method generarBordes() {
		(0 .. ancho-1).forEach{ i => posCasillasCentrales.add(new Position(x=i, y=0)) } // borde abajo
		(0 .. ancho-1).forEach{ i => posCasillasCentrales.add(new Position(x=i, y=alto-1)) } // borde arriba
		
		(1 .. alto-2).forEach{ i => posCasillasLaterales.add(new Position(x=0, y=i)) } // borde izquierdo
		(1 .. alto-2).forEach{ i => posCasillasLaterales.add(new Position(x=ancho-1, y=i)) } // borde derecho

	}
	
	method generarEjeY(){
		posCasillasLaterales.forEach { posicion => 
			var casilla = new Muro(position = posicion)
			game.addVisual(casilla)
			bordeLateral.add(casilla)	
		}
			
	}
	
	method generarEjeX(){
		posCasillasCentrales.forEach { posicion => 
			var casilla = new Muro(position = posicion)
			game.addVisual(casilla)
			bordeCentral.add(casilla)	
		}
	}
	
	method iniciar() {
		self.generarBordes()
		self.generarEjeX()
		self.generarEjeY()
	}
		
}



// al nivel 0 lo instancie cuando carga el juego
object nivel1 inherits Nivel {
	
	override method iniciar() {
		self.agregandoMuros()
		super()	
	}
	
	method agregandoMuros() {
		(5 .. ancho-5).forEach{ i => posCasillasCentrales.add(new Position(x=i, y=3)) } // borde abajo
		(5 .. ancho-5).forEach{ i => posCasillasCentrales.add(new Position(x=i, y=alto-5)) } // borde arriba
			
	}
		
}


