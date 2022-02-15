//
//  RestaurantCollectionCell.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import UIKit
import Alamofire

class RestaurantCollectionCell: UICollectionViewListCell {
    
    // MARK: - Parent
    private let restaurantView: RestaurantView = {
        let view = RestaurantView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstrained(subview: restaurantView)
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String, describtion: String, hours: String, rating: String, image: String)  {
        restaurantView.configure(name: name, describtion: describtion, hours: hours, rating: rating, image: image)
    }
    
}
