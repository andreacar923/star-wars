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

class PersonCardModel : ObservableObject
{
    var name: String
    var imageLink: String
    @Published var image: UIImage = UIImage(named: "placeholder")!
    
    init(name: String, imageLink: String)
    {
        self.name = name
        self.imageLink = imageLink
    }
}
