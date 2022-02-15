//
//  ActivityIndicator.swift
//
//  Created by Ayman Ibrahim on 12/28/18.
//

import UIKit
import ObjectiveC

fileprivate let spinnerSize: CGFloat = 46

protocol Progressable {
    func showProgress()
    func showProgress(to View:UIView)
    func dismissProgress()
}


extension Progressable where Self: UIViewController {
    
    fileprivate func getSpinner() -> UIActivityIndicatorView {
        spinner = UIActivityIndicatorView(style: .large)
        spinner.frame.size = CGSize(width: spinnerSize, height: spinnerSize)
        spinner.startAnimating()
        return spinner
    }
    
    func showProgress() {
        let spinner = getSpinner()
        self.view.addSubview(spinner)
        constrainSpinnerToCenter(view: self.view, spinner: spinner)
    }

    func progress(isShow: Bool) {
        if isShow {
            let spinner = getSpinner()
            self.view.addSubview(spinner)
            constrainSpinnerToCenter(view: self.view, spinner: spinner)
        } else {
            dismissProgress()
        }
    }
    
    func showProgress(to parentView: UIView) {
        let spinner = getSpinner()
        parentView.addSubview(spinner)
        constrainSpinnerToCenter(view: parentView, spinner: spinner)
    }
    
    fileprivate func constrainSpinnerToCenter(view: UIView, spinner: UIActivityIndicatorView) {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            let safeAreaGuide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                spinner.centerXAnchor.constraint(equalTo: safeAreaGuide.centerXAnchor), spinner.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor) ])
        } else {
            NSLayoutConstraint.activate([
                spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor) ])
        }
    }
    
    func dismissProgress() {
        spinner.removeFromSuperview()
    }
}

fileprivate var catKey: UInt8 = 0 // We still need this boilerplate
extension UIViewController {
    
    var spinner: UIActivityIndicatorView {
        get {
            return associatedObject(base: self, key: &catKey) {
                return UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            } // Set the initial value of the var
        }
        set {
            associateObject(base: self, key: &catKey, value: newValue)
        }
    }
    
    func associatedObject<ValueType: AnyObject>(base: AnyObject,key: UnsafePointer<UInt8>, initialiser: () -> ValueType)-> ValueType {
        if let associated = objc_getAssociatedObject(base, key)
            as? ValueType { return associated }
        let associated = initialiser()
        objc_setAssociatedObject(base, key, associated,.OBJC_ASSOCIATION_RETAIN)
        return associated
    }
    
    func associateObject<ValueType: AnyObject>(base: AnyObject,key: UnsafePointer<UInt8>,value: ValueType) {
        objc_setAssociatedObject(base, key, value, .OBJC_ASSOCIATION_RETAIN)
    }
}

