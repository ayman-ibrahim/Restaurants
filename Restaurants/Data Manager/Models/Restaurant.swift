//
//  Restaurant.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import Foundation

struct Restaurant: Codable {
    let id: Int
    let name, description, hours: String
    let image: String
    let rating: Int
    let distance: Double
    let hasOffer: Bool
    let offer: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case description = "description"
        case hours, image, rating, distance, hasOffer, offer
    }
    
    func getListObject() -> RestaurantListObject {
        RestaurantListObject(id: id, name: name, description: description, hours: hours, image: image, rating: rating, hasOffer: hasOffer)
    }
}

struct RestaurantListObject: Hashable {
    let id: Int
    let name, description, hours: String
    let image: String
    let rating: Int
    let hasOffer: Bool
}
