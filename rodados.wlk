class Corsa{
    //var position = new Position(x=0, y=0) // game.at(0,0)
    var property color 
    method initialize() {
        if(coloresValidos.listaColores().contains(color)){
            self.error(color.toString() + "el auto no tiene un color válido")
        }
    }
    method capacidad() = 4
    method velocidadMaxima()= 150
    method peso() = 1300
}

class Kwid {
    var property tieneTanqueAdicional
    method capacidad() = if(tieneTanqueAdicional) 3 else 4
    method velocidadMaxima() = if(tieneTanqueAdicional)110 else 120
    method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0
    method color() = "azul"
}

object traffic {
    var property interior = comodo
    var property motor = pulenta
    method capacidad() = interior.capacidad()
    method velocidadMaxima() = motor.velocidad()
    method peso() = 4000 + interior.peso() + motor.peso()
    method color() = "blanco"
}
object pulenta {
    method peso() = 800
    method velocidad() = 130  
}
object bataton {
    method peso() = 500
    method velocidad() = 80
}
object comodo {
    method capacidad() = 5 
    method peso() = 700
}
object popular {
  method capacidad() = 12
  method peso() = 1000
}

class Especial{
    var property capacidad
    var property peso
    var property color
    const velocidadMaxima
    method velocidadMaxima() = 
        velocidadMaxima.min(topeDeVelocidadMaxima.tope())
    method initialize() {
        if(coloresValidos.listaColores().contains(color)){
            self.error(color.toString() + "el auto no tiene un color válido")
        }
    }   
}

object topeDeVelocidadMaxima {
    var property tope = 200
}

class Dependencia {
    const flota = []
    var property empleados = 0

    method agregarAFlota(rodado) {
        flota.add(rodado)
        } 
    method quitarDeFlota(rodado) {flota.remove(rodado)}
    method pesoTotalFLota() = flota.sum({a=>a.peso()})
    method estaBienEquipada() = self.cantidadRodados() && self.todosVanAlMenosA100()
    method cantidadRodados() = flota.size() > 2
    method todosVanAlMenosA100() = flota.all({a=>a.velocidad()>100})
    method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({a=>a.capacidad()}) 
    method rodadosDeColor(color) = flota.filter({a=>a.color() == color})
    method colorDelRodadoMAsRapido() = self.rodadoMasRapido().color()
    method rodadoMasRapido() = flota.max({a=>a.velocidadMaxima()})
    method capacidadFaltante() = (empleados - self.capacidadDeLaFlota()).max(0)
    method capacidadDeLaFlota() = flota.sum({a=>a.capacidad()})
    method esGrande() = empleados >= 40 && self.cantidadRodados() > 5 
    }
    //INTENTOGUARDAR

class coloresValidos{
    const property listaColores = #{"rojo","azul","verde","blanco"}
}
