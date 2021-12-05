//
//  main.swift
//  myhomework
//
//  Created by Alex Sobolev on 28.11.2021.
//

import Foundation

print("Hello, World!")

enum Transmission: String {
     case auto = "автоматическая"
     case manual = "механическая"
 }
 
enum WindowState: String {
     case open = "окна открыты"
     case close = "окна закрыты"
 }

enum CarType: String {
    case sedan = "седан"
    case hatchback = "хэтчбэк"
    case cabriolet = "кабриолет"
    case universal = "универсал"
}

enum TruckType: String {
    case opened = "открытый"
    case closed = "закрытый"
    case special = "специальный"
}

enum TypeOfDrive: String {
    case fourWheelDrive = "полноприводный"
    case frontWheelDrive = "переднеприводный"
    case rearWheelDrive = "заднеприводный"
}

class Car {
    let brand: String
    let color: String
    let year: Int
    let km: Double
    let transmission: Transmission
    var typeOfDrive: TypeOfDrive
    var carType: CarType
    var windowState: WindowState

    init(brand: String,
         color: String,
         year: Int,
         km: Double,
         transmission: Transmission,
         typeOfDrive: TypeOfDrive,
         carType: CarType,
         windowState: WindowState) {
        
        self.brand = brand
        self.color = color
        self.transmission = transmission
        self.km = km
        self.carType = carType
        self.typeOfDrive = typeOfDrive
        self.year = year
        self.windowState = windowState
    }

func openWindow() {
    windowState = .close
    print("Окна открыты")
    }
func closedWindow(){
    windowState = .close
    print("Окна закрыты")
    }
}

class TrunkCar: Car {
    var liftingCapacity: Double
    init(brand: String,
         color: String,
         year: Int,
         km: Double,
         transmission: Transmission,
         typeOfDrive: TypeOfDrive,
         carType: CarType,
         windowState: WindowState,
         liftingCapacity: Double) {
    
     self.liftingCapacity = liftingCapacity
        
        super.init(brand: brand,
              color: color,
              year: year,
              km: km,
              transmission: transmission,
              typeOfDrive: typeOfDrive,
              carType: carType,
              windowState: windowState)
}
    
override func openWindow() {
    super.openWindow()
    print("Закройте, пожалуйста, окна!")
    }
}

class SportCar: Car {
    var maxSpeed: Int
    init(maxSpeed: Int,
         brand: String,
         color: String,
         year: Int,
         km: Double,
         transmission: Transmission,
         typeOfDrive: TypeOfDrive,
         carType: CarType,
         windowState: WindowState) {
    
        self.maxSpeed = maxSpeed
        
        super.init(brand: brand,
              color: color,
              year: year,
              km: km,
              transmission: transmission,
              typeOfDrive: typeOfDrive,
              carType: carType,
              windowState: windowState)
    }
    override func closedWindow() {
        super.closedWindow()
        print("Откройте, пожалуйста, окна!")
    }
}
    
var trunkCar = TrunkCar(brand: "Scania", color: "yellow", year: 2016, km: 40000, transmission: .manual, typeOfDrive: .fourWheelDrive, carType: .universal, windowState: .open, liftingCapacity: 40)
    trunkCar.openWindow()

var sportCar = SportCar(maxSpeed: 360, brand: "Porsche", color: "green", year: 2020, km: 1500, transmission: .auto, typeOfDrive: .rearWheelDrive, carType: .cabriolet, windowState: .open)
    sportCar.closedWindow()

print("модель грузовика: \(trunkCar.brand), цвет грузовика: \(trunkCar.color), год выпуска: \(trunkCar.year), пробег \(trunkCar.km), трансмиссия: \(trunkCar.transmission), максимальная грузоподъемность \(trunkCar.liftingCapacity) тонн")

print("модель спорткара: \(sportCar.brand), цвет грузовика: \(sportCar.color), год выпуска: \(sportCar.year), пробег \(sportCar.km), трансмиссия: \(sportCar.transmission), вид спортака \(sportCar.carType) ")


