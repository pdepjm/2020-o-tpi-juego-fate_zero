import wollok.game.*
import objetos.*

object aleatoria {
	method nuevaPosicion(unObjeto) {
		const x = 0.randomUpTo(game.width()-1).truncate(0)
		const y = 0.randomUpTo(game.height()-1).truncate(0)
		unObjeto.posicionAleatoria(game.at(x, y))
	}
	
}
