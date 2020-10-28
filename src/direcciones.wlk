import objetos.*
import serpiente.*

class Direccion {
	var property imagenCabeza
	var property imagenCuerpo
	
	method cabezaSegunDirecc() { cabezaSnake.cambiarImagen(imagenCabeza) }
	method cuerpoSegunDirecc(unaParte) { unaParte.cambiarImagen(imagenCuerpo) }
}



object arriba inherits Direccion(imagenCabeza = "cabeza-arriba.png", imagenCuerpo = "cuerpo-vertical.png") {
	method siguientePosicion() = cabezaSnake.position().up(1)
	method contraria() = abajo
}

object abajo inherits Direccion(imagenCabeza = "cabeza-abajo.png", imagenCuerpo = "cuerpo-vertical.png") {
	method siguientePosicion() = cabezaSnake.position().down(1)
	method contraria() = arriba
}

object izquierda inherits Direccion(imagenCabeza = "cabeza-izquierda.png", imagenCuerpo = "cuerpo-horizontal.png") {
	method siguientePosicion() = cabezaSnake.position().left(1)
	method contraria() = derecha
}

object derecha inherits Direccion(imagenCabeza = "cabeza-derecha.png", imagenCuerpo = "cuerpo-horizontal.png") {
	method siguientePosicion() = cabezaSnake.position().right(1)
	method contraria() = izquierda
}