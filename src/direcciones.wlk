import objetos.*

object direccArriba {
	method siguientePosicion() {cabezaSnake.position().up(1)}
}

object direccAbajo {
	method siguientePosicion() {cabezaSnake.position().down(1)}
}

object direccDerecha {
	method siguientePosicion() {cabezaSnake.position().right(1)}
}

object direccIzquierda {
	method siguientePosicion() {cabezaSnake.position().left(1)}
}