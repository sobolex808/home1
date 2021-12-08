//
//  main.swift
//  myhomework
//
//  Created by Alex Sobolev on 28.11.2021.
//

import Foundation

print("Hello, World!")


// MARK: - Enums

enum Transmission {
     case auto
     case manual
}
 
enum WindowState {
     case open
     case close
}

enum DoorState {
    case open
    case close
}

enum CarType {
    case sedan
    case cabriolet
}


enum TypeOfDrive {
    case fourWheelDrive
    case frontWheelDrive
}

// MARK: - CarProtocol

protocol CarProtocol {
    var brand: String { get set }
    var color: String { get set }
    var year: Int { get set }
    var km: Double { get set }
    var transmission: Transmission { get set }
    var windowState: WindowState { get set }
    var doorState: DoorState { get set }

    func driveCar()
}

extension CarProtocol {
    mutating func windowIsOpen() {
        switch windowState {
        case .open:
            print ("Окна уже открыты")
        case .close:
        self.windowState = .open
            print ("Откройте окна")
        }
}

    mutating func windowIsClose() {
        switch windowState {
        case .open:
        self.windowState = .close
            print ("Окна закрыты")
        case .close:
            print ("Окна уже закрыты")
        }
}
    
    mutating func doorIsOpen() {
        switch doorState {
        case .open:
            print ("Двери уже открыты")
        case .close:
        self.doorState = .close
            print ("Откройте двери")
        }
}

    mutating func doorIsClose() {
        switch doorState {
        case .open:
        self.doorState = .close
            print ("Двери закрыты")
        case .close:
            print ("Двери уже закрыты")
        }
    }
}

// MARK: - Classes

final class TrunkCar: CarProtocol {
    var brand: String
    var color: String
    var year: Int
    var km: Double
    var doorState: DoorState
    var transmission: Transmission
    var typeOfDrive: TypeOfDrive
    var windowState: WindowState
    
    init(brand: String,
         color: String,
         year: Int,
         km: Double,
         transmission: Transmission,
         typeOfDrive: TypeOfDrive,
         windowState: WindowState,
         doorState: DoorState)
    
    {
        self.brand = brand
        self.color = color
        self.year = year
        self.km = km
        self.transmission = transmission
        self.typeOfDrive = typeOfDrive
        self.windowState = windowState
        self.doorState = doorState
    }

    func driveCar() {
        switch typeOfDrive {
        case .fourWheelDrive:
            self.typeOfDrive = .frontWheelDrive
            print("Грузовой автомобиль \(brand) переключил тип привода на \(typeOfDrive)")
        case .frontWheelDrive:
            print("У грузового автомобиля \(brand) уже подключен передний привод")
        }
    }
}

final class SportCar: CarProtocol {
    var brand: String
    var color: String
    var year: Int
    var km: Double
    var doorState: DoorState
    var transmission: Transmission
    var typeOfDrive: TypeOfDrive
    var windowState: WindowState
    var carType: CarType
    
    init(brand: String,
         color: String,
         year: Int,
         km: Double,
         transmission: Transmission,
         typeOfDrive: TypeOfDrive,
         windowState: WindowState,
         doorState: DoorState,
         carType: CarType)
    {
        
        self.brand = brand
        self.color = color
        self.year = year
        self.km = km
        self.transmission = transmission
        self.typeOfDrive = typeOfDrive
        self.windowState = windowState
        self.doorState = doorState
        self.carType = carType
    }

    func driveCar() {
        switch carType {
        case .sedan:
            self.carType = .cabriolet
            print("Сегодня жаркая погода. Спорткар \(brand) опустил крышу и теперь он \(carType)")
        case .cabriolet:
            print("Сегодня жаркая погода. У Спорткара \(brand) крыша уже опущена")
        }
    }
}

//MARK: -CustomStringConvertible

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "TrunkCar brand: \(brand)\(color), year: \(year), km: \(km), window state: \(windowState), type of drive: \(typeOfDrive)"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "SportCar brand: \(brand)\(color), year: \(year), km: \(km), window state: \(windowState), type of drive: \(typeOfDrive), car type: \(carType)"
    }
}

var sportCarPorsche = SportCar(brand: "Porshe", color: "Green", year: 2020, km: 3000, transmission: .manual, typeOfDrive: .frontWheelDrive, windowState: .open, doorState: .close, carType: .sedan)
sportCarPorsche.doorIsClose()
sportCarPorsche.windowIsClose()
print(sportCarPorsche.description)

var trunkCarScania = TrunkCar(brand: "Scania", color: "black", year: 2015, km: 120000, transmission: .auto, typeOfDrive: .fourWheelDrive, windowState: .close, doorState: .open)
trunkCarScania.doorIsClose()
trunkCarScania.windowIsOpen()
print(trunkCarScania.description)


