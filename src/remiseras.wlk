//Clientes
object ludmila {

	method valor() = 18

}

object ana {

	var estaEstable = true

	method valor() = if (estaEstable) 30 else 25

	method cambiarEstado() {
		estaEstable = not estaEstable
	}

	method estaEstable() = estaEstable

}

object teresa {

	var valor = 22

	method valor() = valor

	method cambiarValor(valorNuevo) {
		valor = valorNuevo
	}

}

object melina {

	var cliente

	method trabajaPara(clienteNuevo) {
		cliente = clienteNuevo
	}

	method cliente() = cliente

	method valor() = cliente.valor() - 3

}

//Remiseras
object roxana {

	method precioViaje(clienteQuePregunta, km) = clienteQuePregunta.valor() * km

}

object gabriela {

	method precioViaje(clienteQuePregunta, km) = clienteQuePregunta.valor() * km * 1.2

}

object mariela {

	method precioViaje(clienteQuePregunta, km) = 50.max(clienteQuePregunta.valor() * km)

}

object juana {

	method precioViaje(clienteQuePregunta, km) = if (km <= 8) 100 else 200

}

object lucia {

	var compaARemplazar = mariela

	method remplazarA(compa) {
		compaARemplazar = compa
	}

	method esRemplazoDe() = compaARemplazar

	method precioViaje(clienteQuePregunta, km) = compaARemplazar.precioViaje(clienteQuePregunta, km)

}

//Oficina
object oficina {

	var primerRemisera
	var segundaRemisera

	method primerRemiseraAsignada() = primerRemisera

	method segundaRemiseraAsignada() = segundaRemisera

	method asignarRemiseras(remisera1, remisera2) {
		primerRemisera = remisera1
		segundaRemisera = remisera2
	}

	method intercambiarRemiseras() {
		self.asignarRemiseras(segundaRemisera, primerRemisera)
	}

	method remiseraElegidaParaViaje(cliente, kms) {
		return if (primerRemisera.precioViaje(cliente, kms) - segundaRemisera.precioViaje(cliente, kms) > 30) {
			segundaRemisera
		} else {
			primerRemisera
		}
	}

}

