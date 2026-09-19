object nave {
  const pasajeros = #{neo, morfeo, trinity}  

  method subirANave(pasajero) {
    pasajeros.add(pasajero)
  }

  method bajarDeNave(pasajero) {
    pasajero.remove(pasajero)
  }

  method cantidadDePasajeros() = pasajeros.size()
  method pasajeroDemayorVitalidad() = pasajeros.max({pasajero => pasajero.vitalidad()}) 
  method pasajeroDeMenorVitalidad() = pasajeros.min({pasajero => pasajero.vitalidad()})

  method esEquilibradaEnVitalidad() = self.pasajeroDemayorVitalidad().vitalidad() <= self.pasajeroDeMenorVitalidad().vitalidad() * 2
  //Tambien, si quiero solo su valor maximo, pasajeros.map({pasajero => pasajero.vitalidad()}).max(), map me devuelve una lista de numeros y max() su maximo numero.
  //La formula, max <= min * 2 

  method estaEnNaveElElegido() = pasajeros.any({pasajero => pasajero.esElegido()})

  method naveChoca() {
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }

  method naveAcelera() {
    pasajeros.forEach({p => if(!p.esElegido())p.saltar()})
    //Tambien, pasajeros.filter({p => not p.esElegido()}).forEach({p => p.saltar()})
    //La lista, con filter, quedaria [trinity, morfeo] y luego en esa lista hago que todos salten con forEach.
    pasajeros.removeAll(pasajeros)
  }
}


//Pasajeros
object neo {
 
  var energia = 100
  method esElegido() = true
  
  method vitalidad() = energia / 10 // la decima parte de su energia

  method saltar() {
    energia = energia / 2 //La mitad de su energia
  }
}

object morfeo {

  var vitalidad = 8
  var descansado = true
  method esElegido() = false
  method vitalidad() = vitalidad

  method saltar() {
        
    descansado = !descansado //Tambien, not descansado
    vitalidad = (vitalidad - 1).max(0) //El .max(0) es para que el valor no sea menor a 0

  }

}
object trinity {
  method esElegido() = false
  method vitalidad() = 0
  method saltar() {} //No hace nada, pero debemos respetar el polimorfismo
}



