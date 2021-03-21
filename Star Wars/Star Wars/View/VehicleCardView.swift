//
//  VehicleCardView.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 21/03/21.
//

import SwiftUI

struct VehicleCardView: View
{
    @ObservedObject var vehicle: VehicleCardModel
    var body: some View
    {
        VStack(alignment: .leading, spacing: 20)
        {
            HStack(alignment: .top)
            {
                VStack(alignment: .leading, spacing: 10)
                {
                    Text(vehicle.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        
                    Text(vehicle.model)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text(vehicle.price)
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
            }
             
            ForEach([
                        Info(tag: "Producer", data: vehicle.producer),
                        Info(tag: "Passengers", data: vehicle.passengers),
                        Info(tag: "Crew", data: vehicle.crew),
                        Info(tag: "Cargo", data: vehicle.cargoCapacity)
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
                        .font(.title3)
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

struct VehicleCardView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleCardView(vehicle: .init(vehicle: .init(name: "Falcon", model: "9", manufacturer: "ABC", cost_in_credits: "500", max_atmoshpering_speed: "1", crew: "2", passengers: "32", cargo_capacity: "2333", consumables: "3000", hyperdrive_rating: nil, mglt: nil, starship_class: nil, pilots: [], films: [], created: "", edited: "", url: "")))
    }
}
