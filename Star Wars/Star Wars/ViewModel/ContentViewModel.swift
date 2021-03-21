//
//  ContentViewModel.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 17/03/21.
//

import SwiftUI

class ListDecoder: Decodable
{
    var count: Int
    var next: String?
    var previous: String?
    var results: [Person]
}

class ContentViewModel: ObservableObject
{
    @Published var people: [Person] = []
    @Published var cardsModel: [PersonCardModel] = []
    @Published var peopleDetailed: [PersonDetailedViewModel] = []
    
    func fetchPeople()
    {
        people.removeAll()
        let urlFirst = "https://swapi.dev/api/people/"
        
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
                                        self.cardsModel.append(PersonCardModel(name: datas.name, imageLink: "https://mobile.aws.skylabs.it/mobileassignments/swapi/\(index).png" ))
                                        self.peopleDetailed.append(PersonDetailedViewModel(datas))
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
