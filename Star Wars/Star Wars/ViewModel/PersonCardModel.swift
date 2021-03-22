//
//  PersonCardModel.swift
//  Star Wars
//
//  Created by Andrea Caramagno on 18/03/21.
//

import Foundation
import UIKit
import SwiftUI
import Combine
//Model per card persona
class PersonCardModel : ObservableObject
{
    var name: String
    var imageLink: String
    @Published var image: UIImage = UIImage(named: "placeholder")! //Immagine carica in modo asincrono, ecco perchè è Published
    
    init(name: String, imageLink: String)
    {
        self.name = name
        self.imageLink = imageLink
    }
}
