//
//  Model.swift
//  LesHabituesTest
//
//  Created by Mathias Erligmann on 10/03/2022.
//

import Foundation

struct Model: Codable {
    let object: String
    let total: Int
    let data: [Shop]
}

struct Shop: Codable {
    let id: Int
    let chain: String
    let category: String
    let offers: [Offer]
    let localisations: [Localisation]
    let picture_url: String
}

struct Offer: Codable {
    let id: String
    let amount: String
    let reduction: String
}

struct Localisation: Codable {
    let id: Int
    let name: String
    let address: String
    let zipcode: String
    let city: String
}


