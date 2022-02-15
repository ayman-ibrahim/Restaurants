//
//  Resolver.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/13/22.
//

import Foundation

var Resolver = DependencyResolver()

class DependencyResolver {
    
    lazy var remoteContext = RemoteContext()
    lazy var remoteDS = RemoteDS(context: remoteContext)
    lazy var getRestaurantsUseCase = GetRestaurantsUseCase(repo: remoteDS)
    
    lazy var restaurantsViewModel = RestaurantsViewModel(getRestaurantsUseCase: getRestaurantsUseCase)
}
