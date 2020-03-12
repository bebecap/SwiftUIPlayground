//
//  ContentView.swift
//  WatchVehicles Extension
//
//  Created by Volodymyr Grytsenko on 09.03.20.
//  Copyright © 2020 Volodymyr Grytsenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: VehiclesViewModel
    
    var body: some View {
        List(viewModel.vehicles) {
            VehicleView(viewModel: $0)
        }.navigationBarTitle(Text("Vehicle list")).onAppear {
            self.viewModel.loadVehicles()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: RootViewModel().vehiclesViewModel)
    }
}
