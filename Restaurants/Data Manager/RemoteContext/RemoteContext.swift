//
//  RemoteContext.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import Foundation
import Alamofire

protocol RemoteContextRequestsProtocol {
    func doRequest<T: Decodable>(request: URLRequestConvertible) async throws -> Array<T>
}

class RemoteContext: RemoteContextRequestsProtocol {

    func doRequest<T>(request: URLRequestConvertible) async throws -> Array<T> where T : Decodable {
        return try await AF.request(request).serializingDecodable([T].self).value
    }
}
