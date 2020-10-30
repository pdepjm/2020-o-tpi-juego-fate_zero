import wollok.game.*
import objetos.*
import direcciones.*
import titulosYfondos.*
import niveles.*
import serpiente.*

object snakeGame {
	var property nivel = nivel1
	var property jugando = false
	var property perdio = false
	var property pocionAzulActivada = false
	var won = false
	
	method iniciar() {
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		game.start()
	}
	
	method configurarJuego() {
		game.title("Snake Game")
		game.width(32)
		game.height(18)
		game.cellSize(35)
	}
	
	method agregarPersonajes() {
		serpiente.inicializar()
		nivel.iniciar()
	}
	
	method configurarTeclas() {
		
		// TECLAS DE DIRECCION
		keyboard.up().onPressDo({
			if(not pocionAzulActivada){
				serpiente.direccionElegida(arriba)
			}else {
				serpiente.direccionElegida(abajo)
			}
		})
		keyboard.down().onPressDo({
			if(not pocionAzulActivada){
				serpiente.direccionElegida(abajo)
			}else {
				serpiente.direccionElegida(arriba)
			}
		})
		keyboard.left().onPressDo({
			if(not pocionAzulActivada){
				serpiente.direccionElegida(izquierda)
			}else {
				serpiente.direccionElegida(derecha)
			}
		})
		keyboard.right().onPressDo({
			if(not pocionAzulActivada){
				serpiente.direccionElegida(derecha)
			}else {
				serpiente.direccionElegida(izquierda)
			}
		})
		
		
		// TECLAS ENTER, X Y Q
		keyboard.enter().onPressDo({ 
			if(not jugando and not perdio)
				nivel.empezarAJugar()
		})
		keyboard.x().onPressDo({ 
			if((not jugando and perdio) or won){
				won = false
				nivel.reiniciarNivel()
			}
		})
		keyboard.q().onPressDo({
			if(not jugando)
				game.schedule(100, {game.stop()})
		})
	}
	
	method configurarAcciones() {
		game.onCollideDo(cabezaSnake, {visualColisionado => visualColisionado.choqueConSnake()})
	}
	
	method reproducirSonido(unSonido) {
		const sonido = game.sound(unSonido)
		sonido.play()
	}
	
	method pasarASiguienteNivel() {
		nivel = nivel.siguiente()
		if(nivel != null){
			nivel.iniciar()
		}
	}
	
	method lost() {
		serpiente.detenerse()
		self.reproducirSonido("lose.wav")
		jugando = false
		perdio = true
		game.addVisual(youLost)
	}
	
	method win() {
		serpiente.detenerse()
		self.reproducirSonido("win.wav")
		game.addVisual(youWon)
		won = true
		self.over()
	}
	
	method over() {
		game.schedule(5000, {game.stop()})
	}
}
