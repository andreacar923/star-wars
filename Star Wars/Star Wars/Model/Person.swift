//
//  Person.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 17/03/21.
//

import Foundation
import Combine

struct Person: Decodable
{
    var birth_year: String
    var eye_color: String
    var films: [String]
    var gender: String
    var hair_color: String
    var height: String
    var homeworld: String
    var mass: String
    var name: String
    var skin_color: String
    var created: String
    var edited: String
    var species: [String]
    var starships: [String]
    var url: String
    var vehicles: [String]
}

struct Planet: Decodable
{
    var name: String
    var rotation_period: String
    var orbital_period: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surface_water: String
    var population: String
    var residents: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
}
struct Film: Decodable
{
    var title: String
    var episode_id: Int
    var opening_crawl: String
    var director: String
    var produces: String?
    var release_date: String
    var characters: [String]
    var planets: [String]
    var starships: [String]
    var vehicles: [String]
    var species: [String]
    var created: String
    var edited: String
    var url: String
}

struct Species: Decodable
{
    var name: String
    var classification: String
    var designation: String
    var average_height: String
    var skin_colors: String
    var hair_colors: String
    var eye_colors: String
    var average_lifespan: String
    var homeworld: String?
    var language: String
    var people: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
}

struct Vehicle: Decodable
{
    var name: String
    var model: String
    var manufacturer: String
    var cost_in_credits: String
    var max_atmoshpering_speed: String?
    var crew: String
    var passengers: String
    var cargo_capacity: String
    var consumables: String?
    var hyperdrive_rating: String?
    var mglt: String?
    var starship_class: String?
    var pilots: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
}

struct Starship: Decodable
{
    var name: String
    var model: String
    var manufacturer: String
    var cost_in_credits: String
    var length: String
    var max_atmosphering_speed: String?
    var crew: String
    var passengers: String
    var cargo_capacity: String
    var consumable: String?
    var hyperdrive_rating: String?
    var mglt: String?
    var starship_class: String?
    var pilots: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
}

