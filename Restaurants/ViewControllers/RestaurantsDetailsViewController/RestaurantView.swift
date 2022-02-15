//
//  RestaurantView.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import UIKit

class RestaurantView: UIView {

    // MARK: - Parent
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - SubViews
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGroupedBackground
        label.numberOfLines = 0
        label.font = .regular(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelDesc: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGroupedBackground
        label.numberOfLines = 0
        label.font = .regular(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelHours: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGroupedBackground
        label.numberOfLines = 0
        label.font = .regular(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelRating: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGroupedBackground
        label.numberOfLines = 0
        label.font = .regular(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let margin: CGFloat = 8
    var imageHeight: CGFloat = 120
    
    // MARK: - init
    private let insets: UIEdgeInsets = .zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    init(imageHeight: CGFloat) {
        super.init(frame: .zero)
        self.imageHeight = imageHeight
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI building methods
    private func setUp() {

        addConstrained(subview: containerView, insets: insets)
        
        labelName.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        labelDesc.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        // imageView |⎺|
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageHeight)
        ])
        
        containerView.addSubview(labelName) // |⎺|
        containerView.addSubview(labelDesc) //  ⎺|
        NSLayoutConstraint.activate([

            labelDesc.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: margin),
            labelDesc.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -margin),

            labelName.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: margin),
            labelName.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: margin),
            labelName.trailingAnchor.constraint(equalTo: self.labelDesc.leadingAnchor, constant: -margin),

        ])

        containerView.addSubview(labelHours) // 🀆
        containerView.addSubview(labelRating) //  ⎺|


        let hoursRatingTopConstant: CGFloat = margin
        let hoursRatingBottomConstant: CGFloat = -margin

        NSLayoutConstraint.activate([

            labelHours.topAnchor.constraint(greaterThanOrEqualTo: labelName.bottomAnchor, constant: hoursRatingTopConstant),
            labelHours.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            labelHours.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: hoursRatingBottomConstant),
            labelHours.trailingAnchor.constraint(equalTo: self.labelRating.leadingAnchor, constant: -8),

            labelRating.topAnchor.constraint(greaterThanOrEqualTo: self.labelDesc.bottomAnchor, constant: hoursRatingTopConstant),
            labelRating.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -8),
            labelRating.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: hoursRatingBottomConstant),

            labelHours.heightAnchor.constraint(equalTo: labelRating.heightAnchor),
            labelHours.widthAnchor.constraint(equalTo: labelRating.widthAnchor)
        ])
    }
    
    func configure(name: String, describtion: String, hours: String, rating: String, image: String)  {
        labelName.text = name
        labelDesc.text = describtion
        labelHours.text = hours
        labelRating.text = rating
        imageView.setImageOfUrlStr(str: image)
    }
}
