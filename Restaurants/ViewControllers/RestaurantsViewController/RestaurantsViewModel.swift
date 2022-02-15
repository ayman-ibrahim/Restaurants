//
//  RestaurantsViewModel.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import Foundation
import Combine

enum RestaurantsListState {
    case loading(Bool)
    case error(String)
    case value([RestaurantListObject])
    case filtered([RestaurantListObject])
}

class RestaurantsViewModel {
    
    private let getRestaurantsUseCase: GetRestaurantsUseCase
    private var restaurants = [RestaurantListObject]()
    
    private let resturantsSubject = CurrentValueSubject<RestaurantsListState, Never>(.value([]))
    var resturantsPublisher: AnyPublisher<RestaurantsListState, Never> {
        resturantsSubject.eraseToAnyPublisher()
    }
    
    init(getRestaurantsUseCase: GetRestaurantsUseCase) {
        self.getRestaurantsUseCase = getRestaurantsUseCase
    }
    
    // MARK: - actions
    @MainActor func getRestaurants() {
        Task {
            resturantsSubject.send(.loading(true))
            do {
                let restaurants = try await getRestaurantsUseCase.getRestaurants()
                self.restaurants = restaurants
                resturantsSubject.send(.value(restaurants))
            } catch {
                resturantsSubject.send(.error(error.localizedDescription))
            }
            resturantsSubject.send(.loading(false))
        }
    }
    
    func filterByOffer() {
        if case .filtered = resturantsSubject.value {
            resturantsSubject.send(.value(restaurants))
        } else {
            let offers = self.restaurants.filter(\.hasOffer)
            resturantsSubject.send(.filtered(offers))
        }
    }
}
