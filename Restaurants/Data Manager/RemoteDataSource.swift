//
//  RemoteDataSource.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import Foundation

class RemoteDS {
    
    let context: RemoteContextRequestsProtocol
    init(context: RemoteContextRequestsProtocol) {
        self.context = context
    }
}

extension RemoteDS: APIRepository {
    func getResturants() async throws -> Array<Restaurant> {
        let router = Router.resaturants.get(params: "")
        return try await self.context.doRequest(request: router)
    }
}
