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
	const property anterior
	const property siguiente
	const property titulo
	const property limiteFruta
	const property imagenMuro = "muro.png"
	
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
			var casilla = new Muro(position = unaPosicion, image = imagenMuro)
			game.addVisual(casilla)
		})
	}
	
	
	method dibujarBordes() {
		self.generarBordes()
		self.dibujar(posCasillasLaterales)
		self.dibujar(posCasillasCentrales)
	}
	
	method agregandoMuros() { }
	
	method nuevoFondo() {
		
	}
	
	method iniciar() {
		serpiente.reiniciar()
		self.dibujarBordes()
		self.agregandoMuros()
		fruta.limite(limiteFruta)
		fruta.posicionAleatoria(1)
		game.addVisual(fruta)
		game.addVisual(titulo)
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
		self.reiniciarConteoFruta()
	}
	
	method reiniciarConteoFruta() {
		if(anterior.limiteFruta() == null){
			fruta.vecesComida(0)
		}else {
			fruta.vecesComida(anterior.limiteFruta())
		}
	}
		
}

object nivel1 inherits Nivel(anterior = null, siguiente = nivel2, titulo = start, limiteFruta = 3) { } 


object nivel2 inherits Nivel(anterior = nivel1, siguiente = null, titulo = level1, limiteFruta = 8) {
	var posiciones1 = []
	
	override method iniciar() {
		super()
	}
	
	override method agregandoMuros() {
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=3)) })
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=alto-5)) })
		self.dibujar(posiciones1)
	}
		
}

object nivel3 inherits Nivel(anterior = nivel2, siguiente = null, titulo = level2, limiteFruta = 8, imagenMuro = "rocasV2.png") {
	override method iniciar() {
		game.addVisual(underground)
		super()
	}
}

object nivel4 inherits Nivel(anterior = nivel3, siguiente = null, titulo = level3, limiteFruta = 11, imagenMuro = "rocasV2.png") {
	override method iniciar() {
		game.clear()
		game.addVisual(underground)
		super()
	}
	
	/*override method agregandoMuros() {
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=3)) })
		(5 .. ancho-5).forEach({ i => posiciones1.add(new Position(x=i, y=alto-5)) })
		self.dibujar(posiciones1)
	} */
}

object nivel5 inherits Nivel(anterior = nivel4, siguiente = null, titulo = level3, limiteFruta = 15, imagenMuro = "arbusto.png") {
	override method iniciar() {
		game.clear()
		game.addVisual(grass)
		super()
	}
}

object nivel6 inherits Nivel(anterior = nivel5, siguiente = null, titulo = level3, limiteFruta = 18, imagenMuro = "arbusto.png") {
	override method iniciar() {
		game.addVisual(grass)
		serpiente.reiniciar()
		self.dibujarBordes()
		game.addVisual(titulo)
		game.addVisual(nest)
	}
}

