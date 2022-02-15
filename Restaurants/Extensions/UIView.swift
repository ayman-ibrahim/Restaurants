//
//  UIView.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import UIKit

extension UIView {
    func addConstrained(subview: UIView) {
        addSubview(subview)
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subview.topAnchor.constraint(equalTo: self.topAnchor),
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func addConstrainedTopLeadingTrailing(subview: UIView) {
        addSubview(subview)
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subview.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

    func addConstrained(subview: UIView, insets: UIEdgeInsets) {
        addSubview(subview)
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: insets.left),
            subview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -insets.right),
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top),
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom)
        ])
    }

    func constrainSize(width: CGFloat, height: CGFloat) {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: width),
            self.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
