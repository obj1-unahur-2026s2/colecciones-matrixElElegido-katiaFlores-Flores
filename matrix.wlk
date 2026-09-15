object nave {
  const pasajeros = #{neo, morfeo, trinity}  
  method subirANave(pasajero) {
        pasajeros.add(pasajero)
  }
  method bajarDeNave(pasajero) {
        pasajero.remove(pasajero)
  }
  method cantidadDePasajeros() = pasajeros.size()
  method PasajeroDemayorVitalidad() = pasajeros.max({pasajero => pasajero.vitalidad()})
  method PasajeroDeMenorVitalidad() = pasajeros.min({pasajero => pasajero.vitalidad()})

  method esEquilibradaEnVitalidad() = self.PasajeroDemayorVitalidad().vitalidad() <= self.PasajeroDeMenorVitalidad().vitalidad() * 2

  method estaEnNaveElElegido() = pasajeros.any({pasajero => pasajero.esElegido()})

  method naveChoca() {
        pasajeros.removeAll(pasajeros)
  }
  method naveAcelera() {
        pasajeros.forEach({pasajero => if(!pasajero.esElegido())pasajero.saltar()})
  }
}


object neo {
 
  var energia = 100
  method esElegido() = true
  method energia() = energia
  method vitalidad() = energia / 10

  method saltar() {
        energia = energia / 2
  }
}

object morfeo {

  var vitalidad = 8
  method esElegido() = false
  var descansado = true
  method vitalidad() = vitalidad

  method saltar() {
        
    vitalidad = vitalidad - 1
    descansado = !descansado

  }

}
object trinity {
  method esElegido() = false
  method vitalidad() = 0
  method saltar() {
    
  }
}



