//
//  PersonDetailedView.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 18/03/21.
//

import SwiftUI

struct Info: Hashable
{
    var tag: String
    var data: String
}

struct PersonDetailedView: View
{
    @ObservedObject var personModel: PersonDetailedViewModel
    @State var isLoaded: Bool = false
    var body: some View
    {
        VStack(alignment: .leading, spacing: 20)
        {
            VStack(alignment: .leading, spacing: 5)
            {
                Text(personModel.person.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(personModel.person.birth_year)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal)
            
            VStack(spacing: 20)
            {
                ForEach([
                            Info(tag: "Gender", data: personModel.person.gender),
                            Info(tag: "Hair color", data: personModel.person.hair_color),
                            Info(tag: "Eyes color", data: personModel.person.eye_color),
                            Info(tag: "Height", data: "\(personModel.person.height) cm"),
                            Info(tag: "Mass", data: "\(personModel.person.mass) kg")
                        ], id: \.self)
                {
                    info in
                    HStack(alignment: .center)
                    {
                        Text(info.tag)
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                            
                        Spacer()
                        
                        Text(info.data)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    Divider()
                }

            }
            .padding()
            
            VStack(alignment: .leading, spacing: 10)
            {
                Text("Films")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                if self.personModel.films.isEmpty
                {
                    HStack(alignment: .center)
                    {
                        Spacer()
                        
                        Text("OPS...Is empty")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                }
                else
                {
                    ScrollView(.horizontal)
                    {
                        HStack(spacing: 10)
                        {
                            ForEach(self.personModel.films, id: \.title)
                            {
                                index in
                                    FilmCardView(filmModel: index)
                            }
                            .padding(.leading)
                            .id(UUID())
                        }
                    }
                }
                
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10)
            {
                Text("Vehicles")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                if self.personModel.vehicles.isEmpty
                {
                    HStack(alignment: .center)
                    {
                        Spacer()
                        
                        Text("OPS...Is empty")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                }
                else
                {
                    ScrollView(.horizontal)
                    {
                        HStack(spacing: 10)
                        {
                            ForEach(self.personModel.vehicles, id: \.model)
                            {
                                index in
                                    VehicleCardView(vehicle: index)
                            }
                            .padding(.leading)
                            .id(UUID())
                        }
                    }
                }
                
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10)
            {
                Text("Starships")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                if self.personModel.starships.isEmpty
                {
                    HStack(alignment: .center)
                    {
                        Spacer()
                        
                        Text("OPS...Is empty")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                }
                else
                {
                    ScrollView(.horizontal)
                    {
                        HStack
                        {
                            ForEach(self.personModel.starships, id: \.model)
                            {
                                index in
                                    StarshipCardView(starship: index)
                                        .padding(.horizontal)
                            }
                            .padding(.leading)
                            .id(UUID())
                        }
                    }
                }
                
            }
            .padding(.bottom)
            
        }
        
    }
}

struct PersonDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PersonDetailedView(personModel: PersonDetailedViewModel(
                                                                Person(
                                                                        birth_year: "19BBY",
                                                                        eye_color: "Blue",
                                                                        films: [
                                                                                    "https://swapi.dev/api/films/2/",
                                                                                    "https://swapi.dev/api/films/6/",
                                                                                    "https://swapi.dev/api/films/3/",
                                                                                    "https://swapi.dev/api/films/1/",
                                                                                    "https://swapi.dev/api/films/7/"
                                                                                ],
                                                                        gender: "Male",
                                                                        hair_color: "Blonde",
                                                                        height: "172",
                                                                        homeworld: "https://swapi.dev/api/planets/1/",
                                                                        mass: "77",
                                                                        name: "Luke Skywalker",
                                                                        skin_color: "Fair",
                                                                        created: "",
                                                                        edited: "",
                                                                        species: ["https://swapi.dev/api/species/1/"],
                                                                        starships: [
                                                                                     "https://swapi.dev/api/starships/12/",
                                                                                     "https://swapi.dev/api/starships/22/"
                                                                                    ],
                                                                        url: "",
                                                                        vehicles: [
                                                                                    "https://swapi.dev/api/vehicles/14/",
                                                                                    "https://swapi.dev/api/vehicles/30/"
                                                                                  ]
                                                                     )
            )
            )
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 12")
            
            PersonDetailedView(personModel: PersonDetailedViewModel(
                Person(
                    birth_year: "19BBY",
                    eye_color: "Blue",
                    films: [
                        "https://swapi.dev/api/films/2/",
                        "https://swapi.dev/api/films/6/",
                        "https://swapi.dev/api/films/3/",
                        "https://swapi.dev/api/films/1/",
                        "https://swapi.dev/api/films/7/"
                    ],
                    gender: "Male",
                    hair_color: "Blonde",
                    height: "172",
                    homeworld: "https://swapi.dev/api/planets/1/",
                    mass: "77",
                    name: "Luke Skywalker",
                    skin_color: "fair",
                    created: "",
                    edited: "",
                    species: ["https://swapi.dev/api/species/1/"],
                    starships: [
                        "https://swapi.dev/api/starships/12/",
                        "https://swapi.dev/api/starships/22/"
                    ],
                    url: "",
                    vehicles: [
                        "https://swapi.dev/api/vehicles/14/",
                        "https://swapi.dev/api/vehicles/30/"
                    ]
                )
            )
            )
            .preferredColorScheme(.dark)
        }
    }
}
