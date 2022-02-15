//
//  RestaurantsDetailsViewController.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import UIKit

class RestaurantsDetailsViewController: UIViewController {

    // MARK: - properties
    private let restaurantView: RestaurantView = {
        let view = RestaurantView(imageHeight: 300)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - init
    let restaurant: RestaurantListObject!
    init(restaurant: RestaurantListObject) {
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGroupedBackground
        self.view.addConstrainedTopLeadingTrailing(subview: restaurantView)
        
        restaurantView.configure(name: self.restaurant.name,
                                 describtion: self.restaurant.description,
                                 hours: self.restaurant.hours,
                                 rating: String(self.restaurant.rating),
                                 image: self.restaurant.image)
    }
}
