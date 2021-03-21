//
//  SearchView.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 21/03/21.
//

import SwiftUI

struct SearchBar: View
{
    @Binding var text: String

    @State private var isEditing = false

    var body: some View
    {
        HStack
        {
            TextField("Search by name...", text: $text)
                .padding(7)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .onTapGesture
                {
                    self.isEditing = true
                }

            if isEditing
            {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            Spacer()
        }
    }
}

struct SearchView: View
{
    @ObservedObject var searchModel: SearchModel = .init()
    @State var whatSearch: String = ""
    var body: some View
    {
        VStack(alignment: .leading)
        {
            VStack(alignment: .leading, spacing: 5)
            {
                Text("Search")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                SearchBar(text: $whatSearch)
            }
            
            List(searchModel.people.filter({whatSearch.isEmpty ? true : $0.name.contains(whatSearch)}), id: \.name)
            {
                pos in
                VStack(alignment: .leading)
                {
                    Text(pos.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(pos.birth_year)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
                
            }
            .id(UUID())
            
            Spacer()
            
            
        }
        .padding(.top)
        .padding()
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
