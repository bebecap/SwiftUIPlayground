//
//  VehicleView.swift
//  swift-ui-tests
//
//  Created by Volodymyr Grytsenko on 09.03.20.
//  Copyright © 2020 Volodymyr Grytsenko. All rights reserved.
//

import SwiftUI

struct VehicleView: View {
    @ObservedObject var viewModel: VehicleViewModel
    
    var body: some View {
        VStack {
            VehicleIdentifierView(viewModel: viewModel)
            HStack {
                VehicleRateView(viewModel: viewModel)
                Spacer()
                VehicleStatusView(viewModel: viewModel)
            }
        }.modifier(Modifier.Padding.All()).modifier(Modifier.Background())
    }
}

struct VehicleIdentifierView: View {
    @ObservedObject var viewModel: VehicleViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading) {
                Text(viewModel.make.title).modifier(Modifier.Label.Header())
                Text(viewModel.licensePlate).modifier(Modifier.Label.Title())
            }
            Spacer()
            Image(systemName: "car").resizable().scaledToFit().frame(minWidth: 0, idealWidth: 200, maxWidth: 300, minHeight: 0, idealHeight: 100, maxHeight: 100, alignment: .trailing)
        }
    }
}

struct VehicleRateView: View {
    @ObservedObject var viewModel: VehicleViewModel
    
    var body: some View {
        Text("Minute and day rates")
    }
}

struct VehicleStatusView: View {
    @ObservedObject var viewModel: VehicleViewModel
    
    var body: some View {
        Text("Fuel level and transmission")
    }
}

private extension Vehicle.TransmissionType {
    var title: String {
        switch self {
        case .automatic:
            return "Automatic"
        case .manual:
            return "Manual"
        }
    }
}

private extension Vehicle.Make {
    var title: String {
        switch self {
        case .bmw:
            return "BMW"
        case .mini:
            return "MINI"
        }
    }
}

private extension UIImage {
    static var fallbackVehicleImage: UIImage {
        return UIImage(systemName: "car.fill")!
    }
}
