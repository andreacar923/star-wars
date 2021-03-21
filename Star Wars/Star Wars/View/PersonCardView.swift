//
//  PersonCardView.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 18/03/21.
//

import SwiftUI

struct PersonCardView: View
{
    @ObservedObject var person: PersonCardModel

    var body: some View
    {
        VStack(alignment: .leading)
        {
            AsyncImage(url: URL(string: person.imageLink)!, placeholder: {
                Image("placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            })
            
            VStack(alignment: .leading)
            {
                Text(person.name)
                    .fontWeight(.bold)
                    .font(.title3)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .padding(.bottom, 10)
        }
        .background(Color(.secondarySystemBackground))
        .cornerRadius(20)
        .padding()
    }
}

struct PersonCardView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group {
            PersonCardView(person: PersonCardModel(name: "Luke", imageLink: "https://mobile.aws.skylabs.it/mobileassignments/swapi/1.png"))
            PersonCardView(person: PersonCardModel(name: "Luke", imageLink: "https://mobile.aws.skylabs.it/mobileassignments/swapi/1.png"))
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
        }
        
    }
}
