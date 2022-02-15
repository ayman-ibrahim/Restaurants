//
//  RestaurantsViewController.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import UIKit
import Combine

private enum Section: CaseIterable {
    case main
}

class RestaurantsCollectionViewController: UICollectionViewController, Progressable {
    
    // MARK: - properties
    var viewModel: RestaurantsViewModel!
    private var cancellabels = Set<AnyCancellable>()
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, RestaurantListObject> = {
        let cellRegistration = UICollectionView.CellRegistration<RestaurantCollectionCell, RestaurantListObject> { cell, _, restaurant in
            
            cell.configure(name: restaurant.name,
                           describtion: restaurant.description,
                           hours: restaurant.hours,
                           rating: String(restaurant.rating),
                           image: restaurant.image)
            
            cell.accessories = [.disclosureIndicator()]
        }
        
        return UICollectionViewDiffableDataSource<Section, RestaurantListObject>(collectionView: collectionView) { (collectionView, indexPath, restaurant) -> UICollectionViewCell? in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: restaurant)
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFilterButton()
        
        bind()
        viewModel.getRestaurants()
    }
    
    func bind() {
        viewModel.resturantsPublisher.sink { [weak self] state in
            switch state {
            case .loading(let isLoading):
                self?.progress(isShow: isLoading)
            case .error(let error):
                print(error)
            case .value(let restaurants):
                self?.applySnapshot(restaurants: restaurants)
                self?.navigationItem.rightBarButtonItem?.tintColor = .black
            case .filtered(let restaurants):
                self?.applySnapshot(restaurants: restaurants)
                self?.navigationItem.rightBarButtonItem?.tintColor = .green
            }
        }
        .store(in: &cancellabels)
    }
    
    // MARK: - Collection View
    private func applySnapshot(restaurants: [RestaurantListObject]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, RestaurantListObject>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(restaurants)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let restaurant = dataSource.itemIdentifier(for: indexPath) {
            let detailsVC = RestaurantsDetailsViewController(restaurant: restaurant)
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    // MARK:  -navigation item
    func addFilterButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Offers", style: .plain, target: self, action: #selector(filterAction))
    }
    
    @objc func filterAction() {
        viewModel.filterByOffer()
    }
}

