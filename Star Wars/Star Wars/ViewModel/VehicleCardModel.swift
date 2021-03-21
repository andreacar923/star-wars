//
//  VehiclesCardModel.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 21/03/21.
//

import Foundation
import Combine

class VehicleCardModel: ObservableObject
{
    @Published var name: String
    @Published var model: String
    @Published var producer: String
    @Published var price: String
    @Published var passengers: String
    @Published var crew: String
    @Published var cargoCapacity: String
    
    init(vehicle: Vehicle)
    {
        self.name = vehicle.name
        self.model = vehicle.model
        self.producer = vehicle.manufacturer
        self.price = vehicle.cost_in_credits
        self.passengers = vehicle.passengers
        self.crew = vehicle.crew
        self.cargoCapacity = vehicle.cargo_capacity
    }
}
