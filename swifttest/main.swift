//
//  main.swift
//  swifttest
//
//  Created by A4-iMAC01 on 18/11/2020.
//

import Foundation

class Animal{
    private let nombre:String
    private var peso:Double
    init(nombre:String, peso:Double) {
        self.nombre = nombre
        self.peso = peso
    }
    func comer(comida:Double){
        peso += comida
    }
    func ruido(){
        print("Grrrrr!")
    }
}

var miAnimal:Animal = Animal(nombre: "Tux", peso: 20.4)
miAnimal.ruido()
miAnimal.comer(comida: 0.3)

class Perro : Animal{
    public let color: String //Solo lectura
    private var numeroPatas:Int
    override func ruido() {
        print("Guau")
    }
    public var patas:Int{
        get{
            return self.numeroPatas
        }
        set(nuevoValor){
            if nuevoValor<=4 {
                self.numeroPatas = nuevoValor
            }
        }
    }
    init() {
        color = "Blanco"
        numeroPatas = 4
        super.init(nombre: "Bobby", peso: 1)
    }
}

var miPerro2 = Perro()
//miPerro2.color = "Negro"
print(miPerro2.color)
print(miPerro2.patas)
miPerro2.patas = 3
miPerro2.patas = 10
print(miPerro2.patas)
//miPerro2.numeroPatas=5
var perro = Perro()
var animal:Animal = perro //Upcasting
//animal.patas

//Downcasting sin validacion
var otroPerro : Perro
otroPerro = animal as! Perro
print("Perro de \(otroPerro) patas")


var cosa:String = "Gato"
//Downcasting con validacion
if let unPerro = animal as?Perro{
    print("Perro de \(unPerro.patas) patas")
}else{
    print("No es un perro")
}



/*var miPerro = Perro(nombre: "Boby", peso: 18)

if miPerro is Perro {
    print("Es un perro")
}
if miPerro is Animal {
    print("Es un animal")
}*/



struct ValoresVitales{
    var fuerza: Int
    let vida: Int
}

class Enemigo{
    let nombre:String
    let vital:ValoresVitales
    init(nombre:String, vital:ValoresVitales) {
        self.nombre = nombre
        self.vital = vital
    }
    convenience init (nombre: String, fuerza: Int, vida: Int){
        let vital = ValoresVitales(fuerza: fuerza, vida: vida)
        self.init( nombre:nombre, vital: vital)
    }
    
}

var vitalBuu = ValoresVitales(fuerza: 30, vida: 50)
let buu = Enemigo(nombre: "Buu", vital: vitalBuu)
let vegeta = Enemigo (nombre: "Vegeta", fuerza: 9000, vida: 99999)



class Orco : Enemigo {
    var clan: String
    init(nombre: String, vital: ValoresVitales, clan: String) {
        self.clan = clan
        super.init(nombre: nombre, vital: vital)
    }
    convenience init(nombre:String, fuerza: Int, vida: Int, clan: String){
        let vitalOrco = ValoresVitales(fuerza: fuerza, vida: vida)
        self.init(nombre:nombre, vital:vitalOrco, clan: clan)
    }
}

let thrall = Orco(nombre: "Thrall", fuerza: 40, vida: 25, clan: "Kalimdor")

extension Enemigo {
    var valia: Int{
        return(self.vital.fuerza * self.vital.vida)
    }
    
}
thrall.valia
