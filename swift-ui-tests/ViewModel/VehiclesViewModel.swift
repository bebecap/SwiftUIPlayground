//
//  VehiclesViewModel.swift
//  swift-ui-tests
//
//  Created by Volodymyr Grytsenko on 09.03.20.
//  Copyright © 2020 Volodymyr Grytsenko. All rights reserved.
//

import Combine
import Foundation
import Alamofire

class VehiclesViewModel: ObservableObject {
    
    // MARK: - Internal variables
    
    private let sixtConnector: SixtConnector
    
    // MARK: - Observables
    
    @Published var vehicles: [VehicleViewModel] = []
    @Published var isLoading: Bool = false
    @Published var requestError: AFError? = nil
    
    init(sixtConnector: SixtConnector) {
        self.sixtConnector = sixtConnector
    }
    
    func loadVehicles() {
        isLoading = true
        sixtConnector.loadVehicles { (result) in
            switch result {
            case .success(let vehicles):
                // Delay to see loading state
                sleep(3)
                self.vehicles = vehicles.map{ VehicleViewModel(from: $0) }
            case .failure(let error):
                self.requestError = error
            }
            self.isLoading = false
        }
    }
}
