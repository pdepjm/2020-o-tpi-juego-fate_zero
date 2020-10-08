import wollok.game.*
import objetos.*

object aleatorio {
	var posicion = game.at(8, 8)

	method posicion() = posicion

	method nuevaPosicion() {
		const x = 0.randomUpTo(game.width()-1).truncate(0)
		const y = 0.randomUpTo(game.height()-1).truncate(0)
		posicion = game.at(x, y)
	}
}

object comido {


}