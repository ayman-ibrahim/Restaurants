//
//  RestaurantsTests.swift
//  RestaurantsTests
//
//  Created by Ayman Ibrahim on 2/13/22.
//

import XCTest
import Restaurants
import Alamofire

class RestaurantsTests: XCTestCase {
    
    let restaurantsUseCase = GetRestaurantsUseCase(repo: DummyRepo())

    // asserting that useCase is mapping the type to a view releated type
    func testRestaurantsUseCase() async throws {
        let resturants = try await restaurantsUseCase.getRestaurants()
        assert(resturants.count == 1)
        assert(type(of: resturants.first!) == RestaurantListObject.self)
    }

}

class DummyRepo: APIRepository {
    func getResturants() async throws -> Array<Restaurant> {
        [
            Restaurant(id: 1, name: "name",
                       description: "description",
                       hours: "hours",
                       image: "image",
                       rating: 1,
                       distance: 343.1223,
                       hasOffer: false,
                       offer: nil)]
    }
}
