//
//  ContentView.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 17/03/21.
//

import SwiftUI


struct ContentView: View
{
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var people: ContentViewModel = .init()
    @State var show: Bool = false
    @State var selected: Person?
    @State var selectedImage: String = ""
    @State var selectedIndex: Int = 0
    @State var loadView: Bool = false
    @State var columns: [GridItem] = [GridItem(.flexible())]
    @State var isSearch: Bool = false
    @Namespace var hero
    var body: some View
    {
        ZStack
        {
            //Grid View
            VStack
            {
                HStack(alignment: .top)
                {
                    Text("Start Wars")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing)
                    {
                        //Ricerca
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 23, height: 23)
                            .onTapGesture
                            {
                                withAnimation
                                {
                                    isSearch.toggle()
                                }
                            }
                            .padding(.top, 10)
                            
                        Spacer()
                        
                        //Selezione colonne LazyVGrid
                        HStack(spacing: 10)
                        {
                            Image(systemName: "square.grid.2x2.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 23, height: 23)
                                .foregroundColor(columns.count == 2 ? nil : Color(.secondarySystemBackground))
                                .onTapGesture
                                {
                                    columns = [
                                                GridItem(.flexible()),
                                                GridItem(.flexible())
                                            ]
                                }
                            
                            Image(systemName: "list.dash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 28, height: 30)
                                .foregroundColor(columns.count == 1 ? nil : Color(.secondarySystemBackground))
                                .onTapGesture
                                {
                                    columns = [
                                                GridItem(.flexible())
                                                ]
                                }
                            
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height/9)
                .padding()
                .padding(.top)
                
                ScrollView(.vertical)
                {
                    LazyVGrid(columns: columns) //Griglia o Lista in base alla colonne selezionate
                    {
                        ForEach(0..<people.cardsModel.count, id:\.self)
                        {
                            index in
                            PersonCardView(person: self.people.cardsModel[index])
                                .onTapGesture
                                {
                                    self.people.peopleDetailed[index].fetchFilm()
                                    self.people.peopleDetailed[index].fetchVehicles()
                                    self.people.peopleDetailed[index].fetchStarships()
                                    withAnimation(.spring())
                                    {
                                        self.selectedIndex = index
                                        selectedImage = self.people.cardsModel[index].imageLink
                                        show.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
                                        {
                                            loadView.toggle()
                                        }
                                    }
                                }
                        }
                    }
                }
            }
            
            //Hero animation per far apparire la Detail View
            if show
            {
                VStack(alignment: .leading)
                {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top))
                    {
                        ScrollView(.vertical)
                        {
                            VStack(alignment: .leading)
                            {
                                AsyncImage(
                                            url: URL(string: selectedImage)!,
                                            placeholder:  {
                                                        Image("placeholder")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                    }
                                            )
                                    .matchedGeometryEffect(id: selected?.name, in: hero)
                                
                                
                                PersonDetailedView(personModel: self.people.peopleDetailed[selectedIndex])
                                    
                                
                            }
                            .background(Color(.systemBackground))
                        }
                                
                            
                        if loadView
                        {
                            HStack
                            {
                                Button(action: {show.toggle(); loadView.toggle()})
                                {
                                    Image(systemName: "xmark")
                                        .foregroundColor(Color(.systemBackground))
                                        .padding()
                                        .background(colorScheme == .dark ? Color.white.opacity(0.5) : Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top, 35)
                        }
                    }
                    
                    
                }
                .frame(width: UIScreen.main.bounds.width)
                .animation(.easeInOut)
                .edgesIgnoringSafeArea(.vertical)
                
            }
            
        }
        .sheet(isPresented: $isSearch)
        {
            SearchView()
        }
        .statusBar(hidden: show ? true : false)
        .onAppear(perform: people.fetchPeople)
        
        
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        Group {
            
            ContentView()
                .previewDevice("iPhone 12")
            
            ContentView()
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
        }
    }
}
