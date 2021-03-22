//
//  StarshipModel.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 21/03/21.
//

import Foundation
import Combine
//Model per card Starship
class StarshipCardModel: ObservableObject
{
    @Published var name: String
    @Published var model: String
    @Published var producer: String
    @Published var length: String
    @Published var maxSpeed: String
    @Published var price: String
    @Published var passengers: String
    @Published var crew: String
    @Published var cargoCapacity: String
    
    init(starship: Starship)
    {
        self.name = starship.name
        self.model = starship.model
        self.producer = starship.manufacturer
        self.length = starship.length
        self.maxSpeed = starship.max_atmosphering_speed ?? "unknown"
        self.price = starship.cost_in_credits
        self.passengers = starship.passengers
        self.crew = starship.crew
        self.cargoCapacity = starship.cargo_capacity
    }
}
