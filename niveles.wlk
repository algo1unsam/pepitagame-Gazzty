import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
        config.configurarComida()
		//config.configurarGravedad()  
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
        config.configurarComida()
	//	config.configurarGravedad()
	}
}

object config {

    // REVISAR QUE NO SE MUEVA PEPITA
	method configurarTeclas() {
		if(!pepita.estaCansada()){
            keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1)) })
		    keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		    keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		    keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
        }
        else{
            // No supe como hacer que no se mueva pepita sin energia :(
            keyboard.left().onPressDo({ pepita.irA(pepita.position().left(0)) })
		    keyboard.right().onPressDo({ pepita.irA(pepita.position().right(0))})
		    keyboard.up().onPressDo({ pepita.irA(pepita.position().up(0))})
		    keyboard.down().onPressDo({ pepita.irA(pepita.position().down(0))})
        }
        if(pepita.estaCansada()){
            game.say(pepita, 'PERDI!')
        }
	}
	
	method configurarColisiones() {
		if(game.uniqueCollider(pepita) == nido){
            game.onCollideDo(pepita, { algo => algo.teEncontro(pepita) })
            game.say(pepita, 'GANE!')
        }
        else if(game.uniqueCollider(pepita) == silvestre){
            game.stop()
        }
	}

    method configurarComida(){
        keyboard.c().onPressDo({ 
            pepita.come(game.uniqueCollider(pepita))    
        })
    }
}