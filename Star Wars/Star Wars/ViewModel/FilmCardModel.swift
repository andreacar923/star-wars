//
//  FilmCardModel.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 19/03/21.
//

import Foundation
import Combine
import SwiftUI

//Model card Film
class FilmCardModel: ObservableObject, Identifiable
{
    @Published var title: String = ""
    @Published var year: String = ""
    @Published var description: String = ""
    
    init(title: String, year: String, description: String)
    {
        self.title = title
        self.year = year
        self.description = description
    }
}
