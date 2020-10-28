import wollok.game.*
import snakeGame.*
import serpiente.*
import objetos.*


class Muro{
	var property position
	var property image = "muro.png"
	
	method choqueConSnake() {
		snakeGame.lost()
	}
}



class Nivel {
	const ancho = game.width()
    const alto = game.height()
    
	var posCasillasLaterales = []
	var posCasillasCentrales = []
	
	method generarBordes() {
		(0 .. ancho-1).forEach({ i => posCasillasCentrales.add(new Position(x=i, y=0)) }) // borde abajo
		(0 .. ancho-1).forEach({ i => posCasillasCentrales.add(new Position(x=i, y=alto-1)) }) // borde arriba
		
		(1 .. alto-2).forEach({ i => posCasillasLaterales.add(new Position(x=0, y=i)) }) // borde izquierdo
		(1 .. alto-2).forEach({ i => posCasillasLaterales.add(new Position(x=ancho-1, y=i)) }) // borde derecho

	}
	
	
	method dibujar(posiciones){
		posiciones.forEach({ posicion => 
			const casilla = new Muro(position = posicion)
			game.addVisual(casilla)
		})
	}
	
	method iniciar() {
		self.generarBordes()
		self.dibujar(posCasillasLaterales)
		self.dibujar(posCasillasCentrales)
	}
		
}

// al nivel 0 lo instancie cuando carga el juego
object nivel1 inherits Nivel {
	var posiciones1 = []
	
	override method iniciar() {
		super()	
		self.agregandoMuros()
		self.dibujar(posiciones1)
		serpiente.reiniciar()
		game.addVisual(fruta)
	}
	
	method agregandoMuros() {
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=3)) })
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=alto-5)) })
			
	}
		
}


