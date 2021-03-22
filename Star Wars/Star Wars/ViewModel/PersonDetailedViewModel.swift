//
//  PersonDetailedViewModel.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 18/03/21.
//

import Foundation
import Combine
import SwiftUI

//Model per la vista detail del personaggio
class PersonDetailedViewModel: ObservableObject
{
    @Published var person: Person
    @Published var films: [FilmCardModel] = .init()
    @Published var vehicles: [VehicleCardModel] = .init()
    @Published var starships: [StarshipCardModel] = .init()
    
    init(_ person: Person)
    {
        self.person = person
    }
    
    //Funzione per prendere i film collegati al personaggio e inserire i dati nelle card
    func fetchFilm()
    {
        films.removeAll()
        for link in person.films
        {
            if let url = URL(string: link)
            {
               URLSession.shared.dataTask(with: url)
               {
                    data, response, error in
                        guard let response = response as? HTTPURLResponse else { return }
                        if response.statusCode == 200
                        {
                            if let data = data
                            {
                                DispatchQueue.main.async
                                {
                                    do
                                    {
                                        let datas = try JSONDecoder().decode(Film.self, from: data)
                                        self.films.append(FilmCardModel(title: datas.title, year: datas.release_date, description: datas.opening_crawl))
                                    }
                                    catch let error
                                    {
                                        print(error)
                                    }
                                }
                            }
                        }
                 }.resume()
            }
        }
    }
    
    //Funzione per prendere i dati dei veicoli e inserirli nelle cards dei veicoli
    func fetchVehicles()
    {
        vehicles.removeAll()
        for link in person.vehicles
        {
            if let url = URL(string: link)
            {
               URLSession.shared.dataTask(with: url)
               {
                    data, response, error in
                        guard let response = response as? HTTPURLResponse else { return }
                        if response.statusCode == 200
                        {
                            if let data = data
                            {
                                DispatchQueue.main.async
                                {
                                    do
                                    {
                                        let datas = try JSONDecoder().decode(Vehicle.self, from: data)
                                     
                                        self.vehicles.append(VehicleCardModel(vehicle: datas))
                                    }
                                    catch let error
                                    {
                                        print(error)
                                    }
                                }
                            }
                        }
                 }.resume()
            }
        }
    }
    
    //Funzione per inserire i dati delle astronavi collegate al personaggio e inserirli nelle cards
    func fetchStarships()
    {
        starships.removeAll()
        
        for link in person.starships
        {
            if let url = URL(string: link)
            {
               URLSession.shared.dataTask(with: url)
               {
                    data, response, error in
                        guard let response = response as? HTTPURLResponse else { return }
                        if response.statusCode == 200
                        {
                            if let data = data
                            {
                                DispatchQueue.main.async
                                {
                                    do
                                    {
                                        let datas = try JSONDecoder().decode(Starship.self, from: data)
                                        print(datas)
                                        self.starships.append(StarshipCardModel(starship: datas))
                                    }
                                    catch let error
                                    {
                                        print(error)
                                    }
                                }
                            }
                        }
                 }.resume()
            }
        }
    }
    
}
