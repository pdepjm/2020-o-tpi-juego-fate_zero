import objetos.*
import serpiente.*

object arriba {
	method siguientePosicion() = cabezaSnake.position().up(1)
	method contraria() = abajo
	method imagenSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-arriba.png")}
}

object abajo {
	method siguientePosicion() = cabezaSnake.position().down(1)
	method contraria() = arriba
	method imagenSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-abajo.png")}
}

object izquierda {
	method siguientePosicion() = cabezaSnake.position().left(1)
	method contraria() = derecha
	method imagenSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-izquierda.png")}
}

object derecha {
	method siguientePosicion() = cabezaSnake.position().right(1)
	method contraria() = izquierda
	method imagenSegunDirecc() { cabezaSnake.cambiarImagen("cabeza-derecha.png")}
}