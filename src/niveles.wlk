import wollok.game.*
import snakeGame.*
import serpiente.*
import objetos.*
import titulosYfondos.*


class Nivel {
	const property anterior
	const property siguiente
	const property titulo
	var property background = null
	var property murosInternos = false
	const property limiteFruta
	const property imagenMuro = "muro.png"
	var posMurosInternos = []
	
	
	
	
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
	
	method agregarMurosInternos(unBool) {
		if(unBool){
			(5 .. ancho-5).forEach({ i => posMurosInternos.add(new Position(x=i, y=3)) })
			(5 .. ancho-5).forEach({ i => posMurosInternos.add(new Position(x=i, y=alto-5)) })
			self.dibujar(posMurosInternos)
		}
		
	}
	
	method dibujarBordes() {
		self.generarBordes()
		self.dibujar(posCasillasLaterales)
		self.dibujar(posCasillasCentrales)
	}
		
	
	method iniciar() {
		if(background != null){
			game.addVisual(background)
		}
		
		serpiente.reiniciar()
		self.dibujarBordes()
		self.agregarMurosInternos(murosInternos)
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
		pociones.desaparecer()
		serpiente.reiniciar()
		serpiente.comienzaAMoverse(200)
		snakeGame.jugando(true)
		snakeGame.perdio(false)
		if(not game.hasVisual(hoyo)){
			self.reiniciarConteoFruta()
		}
	}
	
	method reiniciarConteoFruta() {
		if(anterior == null){
			fruta.vecesComida(0)
		}else {
			fruta.vecesComida(anterior.limiteFruta())
		}
	}
}


object nivel1 inherits Nivel(anterior = null, siguiente = nivel2, titulo = start, limiteFruta = 10) {
	
} 


object nivel2 inherits Nivel(anterior = nivel1, siguiente = nivel3, titulo = level1, limiteFruta = 17, murosInternos = true) {
	
}

object nivel3 inherits Nivel(anterior = nivel2, siguiente = null, background = underground, titulo = level2, limiteFruta = 20, imagenMuro = "rocas.png", murosInternos = true) {
	
}


