//
//  FimCardView.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 19/03/21.
//

import SwiftUI

//Card per i Film
struct FilmCardView: View
{
    @ObservedObject var filmModel: FilmCardModel
    var body: some View
    {
        VStack(alignment: .leading, spacing: 20)
        {
           VStack(alignment: .leading, spacing: 5)
           {
                Text(filmModel.title)
                    .font(.title2)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    
                Text(filmModel.year)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            
            VStack
            {
                Text(filmModel.description)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .frame(height: 200)
                

        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
    }
}

struct FilmCardView_Previews: PreviewProvider {
    static var previews: some View {
        FilmCardView(filmModel: .init(title: "", year: "", description: ""))
    }
}
