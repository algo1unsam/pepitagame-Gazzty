import example.*
import pepita.*
import wollok.game.*

object nido {

	var property position = game.at(7, 8)

	method image() = "nido.png"

	method teEncontro(ave) {
		game.say(ave, "GANASTE! WIII")
		game.schedule(2000, { game.stop() })
	}
}


object silvestre {

	method image() = "silvestre.png"

	method position(){
        return if(pepita.position().x() < 3){
            game.at(3,0)
        }else{
            game.at(pepita.position().x(), 0)
        }
    }
}
