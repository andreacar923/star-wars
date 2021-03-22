//
//  StarhshipCardView.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 21/03/21.
//

import SwiftUI

//Card astronave
struct StarshipCardView: View
{
    @ObservedObject var starship: StarshipCardModel
    var body: some View
    {
        VStack(alignment: .leading, spacing: 20)
        {
            HStack(alignment: .top)
            {
                VStack(alignment: .leading, spacing: 10)
                {
                    Text(starship.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        
                    Text(starship.model)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text(starship.price)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
             
            
            //Lista  con info dell'astronave
            ForEach([
                        Info(tag: "Producer", data: starship.producer),
                        Info(tag: "Length", data: starship.length),
                        Info(tag: "Speed", data: starship.maxSpeed),
                        Info(tag: "Passengers", data: starship.passengers),
                        Info(tag: "Crew", data: starship.crew),
                        Info(tag: "Cargo", data: starship.cargoCapacity)
                    ], id:\.self)
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
                        .font(info.tag == "Produce" ? .headline : .title3)
                        .fontWeight(.semibold)
                }
                
                Divider()
            }
        }
        
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
            
    }
}


