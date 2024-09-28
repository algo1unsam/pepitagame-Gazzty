import example.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()
    var property hola = 'Hola'

	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
			} else if (self.esAtrapada() or self.estaCansada()){
				"pepita-gris.png"
				}
					else {
						"pepita.png"}
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
        game.removeVisual(comida)
	}

	method vola(kms) {
		energia = energia - kms * 9 //Change for 5 to let Pepita get to the food
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

    // Custom code
    /* method win() {
        game.whenCollideDo(nido, nido.teEncontro(self))
    } */
    method esAtrapada(){
        return self.position() == silvestre.position()
    }

}