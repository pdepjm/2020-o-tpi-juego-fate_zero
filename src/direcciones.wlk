import objetos.*
import serpiente.*

object arriba {
	method siguientePosicion() = cabezaSnake.position().up(1)
}

object abajo {
	method siguientePosicion() = cabezaSnake.position().down(1)
}

object izquierda {
	method siguientePosicion() = cabezaSnake.position().left(1)
}

object derecha {
	method siguientePosicion() = cabezaSnake.position().right(1)
}