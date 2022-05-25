//
//  PetModel.swift
//  iPet
//
//  Created by Byron Mejia on 5/24/22.
//

import Foundation

struct Pet: Codable {
    var name: String
    var birthday = Date()
    var lastMeal: Date
    var lastDrink: Date
    
    var happinessLevel: String {
        hunger == "Hungry" || thirst == "Thirsty" ? "Unhappy" : "Happy"
    }
    
    var age: Int {
        calcTimeSince(date: birthday)
    }
    
    var hunger: String {
        let timeSince = calcTimeSince(date: lastMeal)
        var string = ""
        
        switch timeSince {
        case 0..<30:
            string = "Satiated"
        case 30..<60:
            string = "Getting hungry..."
        case 60...:
            string = "Hungry"
        default:
            string = "Idk"
        }
        
        return string
    }
    
    var thirst: String {
        var string = ""
        
        switch calcTimeSince(date: lastDrink) {
        case 0..<25: string = "Satiated"
        case 25..<50: string = "Getting thirsty..."
        case 50...: string = "Thirsty"
        default: string = "Idk"
        }
        
        return string
    }
}
