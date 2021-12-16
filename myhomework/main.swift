//
//  main.swift
//  myhomework
//
//  Created by Alex Sobolev on 28.11.2021.
//

import Foundation

print("Hello, World!")

enum CarModel {
     case bmw, renault, audi, honda, kia
 }

 protocol ParkingPlaceProtocol {
     var parkingPlace: Int { get set}

 }

struct ParkingPlace: ParkingPlaceProtocol {
    var parkingPlace: Int
    var modelOfCar: CarModel
 }

 extension ParkingPlace: CustomStringConvertible {
     var description: String {
         return "This amazing \(modelOfCar) stay in number  \(parkingPlace) in garage"
     }
 }


 struct Queue<T: ParkingPlaceProtocol> {
     private var elements: [T] = []

     mutating func enqueue(element: T) {
         elements.append(element)
     }
     mutating func requeue()->T? {
         return elements.removeLast()
     }

     var numberInGarage : Int {
         var parkingPlace = 1
         for element in elements {
             parkingPlace += element.parkingPlace
         }
         return parkingPlace
     }
     
     subscript (elements: Int ...) -> Int{
         var parkingPlace = 1
         for index in elements where index < self.elements.count {
             parkingPlace += self.elements[index].parkingPlace
         }
         return parkingPlace
     }
 }

var garageCar = Queue<ParkingPlace>()

garageCar.enqueue(element: ParkingPlace(parkingPlace: 1, modelOfCar: .bmw))
garageCar.enqueue(element: ParkingPlace(parkingPlace: 3, modelOfCar: .audi))


