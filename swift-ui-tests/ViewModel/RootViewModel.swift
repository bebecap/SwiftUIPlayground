//
//  RootViewModel.swift
//  swift-ui-tests
//
//  Created by Volodymyr Grytsenko on 09.03.20.
//  Copyright © 2020 Volodymyr Grytsenko. All rights reserved.
//

import Foundation

class RootViewModel: ObservableObject {
    
    let sixtConnector: SixtConnector
    
    init() {
        self.sixtConnector = SixtConnector()
    }
    
    var vehiclesViewModel: VehiclesViewModel {
        return VehiclesViewModel(sixtConnector: sixtConnector)
    }
}
