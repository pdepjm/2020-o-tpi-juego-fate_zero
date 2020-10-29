import wollok.game.*
import snakeGame.*
import serpiente.*
import objetos.*
import titulosYfondos.*


class Muro{
	var property position
	var property image = "muro.png"
	
	method choqueConSnake() {
		snakeGame.lost()
	}
}



class Nivel {
	const property siguiente
	const property titulo
	const property reiniciarFruta
	
	
	const ancho = 32 //game.width()
    const alto = 18 //game.height()
    
	var posCasillasLaterales = []
	var posCasillasCentrales = []
	
	method generarBordes() {
		(0 .. ancho-1).forEach({ i => posCasillasCentrales.add(new Position(x=i, y=0)) }) // borde abajo
		(0 .. ancho-1).forEach({ i => posCasillasCentrales.add(new Position(x=i, y=alto-1)) }) // borde arriba
		
		(1 .. alto-2).forEach({ i => posCasillasLaterales.add(new Position(x=0, y=i)) }) // borde izquierdo
		(1 .. alto-2).forEach({ i => posCasillasLaterales.add(new Position(x=ancho-1, y=i)) }) // borde derecho

	}
	
	
	method dibujar(posiciones){
		posiciones.forEach({ unaPosicion => 
			var casilla = new Muro(position = unaPosicion)
			game.addVisual(casilla)
		})
	}
	
	method iniciar() {
		serpiente.reiniciar()
		self.generarBordes()
		self.dibujar(posCasillasLaterales)
		self.dibujar(posCasillasCentrales)
	}
	
	method empezarAJugar() {
		game.removeVisual(titulo)
		serpiente.comienzaAMoverse(200)
		snakeGame.jugando(true)
	}
	
	method reiniciarNivel() {
		game.removeVisual(youLost)
		serpiente.reiniciar()
		serpiente.comienzaAMoverse(200)
		snakeGame.jugando(true)
		snakeGame.perdio(false)
		fruta.vecesComida(reiniciarFruta)
	}
	
	method agregarFrutaYTitulo() {
		fruta.posicionAleatoria(1)
		game.addVisual(fruta)
		game.addVisual(titulo)
	}
		
}

object nivel1 inherits Nivel(siguiente = nivel2, titulo = start, reiniciarFruta = 0) {
	override method iniciar() {
		super()
		game.addVisual(titulo)
	}
} 


object nivel2 inherits Nivel(siguiente = null, titulo = level1, reiniciarFruta = 3) {
	var posiciones1 = []
	
	override method iniciar() {
		super()
		self.agregandoMuros()
		self.dibujar(posiciones1)
		self.agregarFrutaYTitulo()
	}
	
	method agregandoMuros() {
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=3)) })
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=alto-5)) })
			
	}
		
}

object nivel3 inherits Nivel(siguiente = null, titulo = level2, reiniciarFruta = 10) {
	override method iniciar() {
		game.addVisual(underground)
		super()
		self.agregarFrutaYTitulo()
	}
}


