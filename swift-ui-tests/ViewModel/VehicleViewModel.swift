//
//  VehicleViewModel.swift
//  swift-ui-tests
//
//  Created by Volodymyr Grytsenko on 09.03.20.
//  Copyright © 2020 Volodymyr Grytsenko. All rights reserved.
//

import Foundation
import Combine
import MapKit

class VehicleViewModel: ObservableObject, Identifiable {
        
    @Published var id: String
    @Published var modelIdentifier: String
    @Published var modelName: String
    @Published var name: String
    @Published var make: Vehicle.Make
    @Published var group: Vehicle.Make
    @Published var color: String
    @Published var series: String
    @Published var fuelType: Vehicle.FuelType
    @Published var fuelLevel: Double
    @Published var transmission: Vehicle.TransmissionType
    @Published var licensePlate: String
    @Published var latitude: Double
    @Published var longitude: Double
    @Published var carImageUrl: URL
    
    init(from vehicle: Vehicle) {
        id = vehicle.id
        modelIdentifier = vehicle.modelIdentifier
        modelName = vehicle.modelName
        name = vehicle.name
        make = vehicle.make
        group = vehicle.group
        color = vehicle.color
        series = vehicle.series
        fuelType = vehicle.fuelType
        fuelLevel = vehicle.fuelLevel
        transmission = vehicle.transmission
        licensePlate = vehicle.licensePlate
        latitude = vehicle.latitude
        longitude = vehicle.longitude
        carImageUrl = vehicle.carImageUrl
    }
}
