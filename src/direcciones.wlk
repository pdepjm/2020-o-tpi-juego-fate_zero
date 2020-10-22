import objetos.*
import serpiente.*

object arriba {
	method siguientePosicion() = cabezaSnake.position().up(1)
	method contraria() = abajo
	method cabezaSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-arribaV2.png")}
	method cuerpoSegunDirecc(unaParte) {unaParte.cambiarImagen("cuerpo-vertical.png") }
}

object abajo {
	method siguientePosicion() = cabezaSnake.position().down(1)
	method contraria() = arriba
	method cabezaSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-abajo.png")}
	method cuerpoSegunDirecc(unaParte) {unaParte.cambiarImagen("cuerpo-vertical.png") }
}

object izquierda {
	method siguientePosicion() = cabezaSnake.position().left(1)
	method contraria() = derecha
	method cabezaSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-izquierda.png")}
	method cuerpoSegunDirecc(unaParte) {unaParte.cambiarImagen("cuerpo-horizontal.png") }
}

object derecha {
	method siguientePosicion() = cabezaSnake.position().right(1)
	method contraria() = izquierda
	method cabezaSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-derecha.png")}
	method cuerpoSegunDirecc(unaParte) {unaParte.cambiarImagen("cuerpo-horizontal.png") }
}