//
//  APIRepository.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import Foundation

protocol APIRepository {
    func getResturants() async throws -> Array<Restaurant>
}
