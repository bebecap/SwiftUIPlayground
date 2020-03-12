//
//  Vehicle.swift
//  swift-ui-tests
//
//  Created by Volodymyr Grytsenko on 09.03.20.
//  Copyright © 2020 Volodymyr Grytsenko. All rights reserved.
//

import Foundation


struct Vehicle: Codable {
    
    enum Make: String, Codable {
        case bmw = "BMW"
        case mini = "MINI"
    }
    
    enum FuelType: String, Codable {
        case diesel = "D"
        case petrol = "P"
        case electric = "E"
    }
    
    enum TransmissionType: String, Codable {
        case manual = "M"
        case automatic = "A"
    }
    
    enum Cleanliness: String, Codable {
        case regular = "REGULAR"
        case clean = "CLEAN"
        case veryClean = "VERY_CLEAN"
    }
    
    var id: String
    var modelIdentifier: String
    var modelName: String
    var name: String
    var make: Make
    var group: Make
    var color: String
    var series: String
    var fuelType: FuelType
    var fuelLevel: Double
    var transmission: TransmissionType
    var licensePlate: String
    var latitude: Double
    var longitude: Double
    var carImageUrl: URL
}
