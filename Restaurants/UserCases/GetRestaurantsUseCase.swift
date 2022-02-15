//
//  GetRestaurantsUseCase.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import Foundation

class GetRestaurantsUseCase {
    
    private let repo: APIRepository
    
    init(repo: APIRepository) {
        self.repo = repo
    }
    
    func getRestaurants() async throws -> Array<RestaurantListObject> {
        try await self.repo.getResturants().map { $0.getListObject() }
    }
}
