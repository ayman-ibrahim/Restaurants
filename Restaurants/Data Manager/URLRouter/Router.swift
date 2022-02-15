//
//  Router.swift
//

// Source of this file
// https://github.com/chaione/RoutableApp
// https://chaione.com/blog/routers-swift-protocol-oriented-1/
// https://chaione.com/blog/routers-swift-protocol-oriented-programming-pt-2/

//https://drama-spares.com/rest-api/docs/
import Foundation

struct AppEnvironment {
    let BASEURL =  "https://jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com"
}

struct URLDomain {
    let domain = AppEnvironment().BASEURL
    var url: String {
        return domain
    }
}

struct Router: URLRouter {
    static var basePath: String {
        return URLDomain().url
    }

    struct resaturants: Readable {
        var urlParams: String!
        var route: String = "restaurants.json"
    }
}
