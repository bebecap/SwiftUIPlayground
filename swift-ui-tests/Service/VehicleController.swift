//
//  VehicleController.swift
//  swift-ui-tests
//
//  Created by Volodymyr Grytsenko on 09.03.20.
//  Copyright © 2020 Volodymyr Grytsenko. All rights reserved.
//

import Alamofire

private let baseURL = URL(string: "https://cdn.sixt.io/")!

class SixtConnector {
    
    enum Endpoint: String {
        case vehicles = "codingtask/cars"
    }
    
    typealias VehiclesCompletionHandler = (Result<[Vehicle], AFError>) -> Void
    
    func loadVehicles(completion: VehiclesCompletionHandler? = nil) {
        AF.request(baseURL.appendingPathComponent(Endpoint.vehicles.rawValue)).responseDecodable { (response: DataResponse<[Vehicle], AFError>) in
            switch response.result {
            case .success(let vehicles):
                completion?(.success(vehicles))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}
