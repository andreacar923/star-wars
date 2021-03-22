//
//  SearchModel.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 21/03/21.
//

import Foundation
import Combine
import SwiftUI
/*
 Model per la gestione della ricerca,
 ho implementato solo la ricerca per personaggi per mancanza di tempo, ma nel file ci sono anche gli altri oggetti
*/
class SearchModel: ObservableObject
{
    @Published var people: [Person] = .init()
    @Published var films: [Film] = .init()
    @Published var vehicles: [Vehicle] = .init()
    @Published var starships: [Starship] = .init()
    @Published var planets: [Planet] = .init()
    
    init()
    {
        //Fetch People
        var urlFirst = "https://swapi.dev/api/people/"
        for index in 0..<82
        {
            if let url = URL(string: "\(urlFirst)\(index)")
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
                                        let datas = try JSONDecoder().decode(Person.self, from: data)
                                        
                                        self.people.append(datas)
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
        
        //Fetch Films
        urlFirst = "https://swapi.dev/api/films/"
        for index in 0..<6
        {
            if let url = URL(string: "\(urlFirst)\(index)")
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
                                        
                                        self.films.append(datas)
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
        
        //Fetch Vehicles
        urlFirst = "https://swapi.dev/api/vehicles/"
        for index in 0..<39
        {
            if let url = URL(string: "\(urlFirst)\(index)")
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
                                        
                                        self.vehicles.append(datas)
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
        
        //Fetch Starships
        urlFirst = "https://swapi.dev/api/starships/"
        for index in 0..<36
        {
            if let url = URL(string: "\(urlFirst)\(index)")
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
                                        
                                        self.starships.append(datas)
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
        
        //Fetch Planets
        urlFirst = "https://swapi.dev/api/planets/"
        for index in 0..<60
        {
            if let url = URL(string: "\(urlFirst)\(index)")
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
                                        let datas = try JSONDecoder().decode(Planet.self, from: data)
                                        
                                        self.planets.append(datas)
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


