//
//  UIImageView.swift
//  Restaurants
//
//  Created by Ayman Ibrahim on 2/12/22.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageOfUrlStr(str:String?, placeHolder:UIImage? = nil, activityColor: UIColor = .white) {
        var phImg = UIImage()// .getImageWithColor(color: .primary, size: frame.size)
        if let url = str {
            if let url = URL(string: url) {
                // let resource = ImageResource(downloadURL: url)
                let placeHolder = placeHolder != nil ? placeHolder : phImg
                var kf = self.kf
                kf.indicatorType = .activity
                let activity = kf.indicator?.view as! UIActivityIndicatorView
                activity.color = activityColor
                kf.setImage(with: url, placeholder: placeHolder, options: [.transition(.fade(0.2))])
            }
        } else if let ph = placeHolder {
            phImg = ph
            self.image = phImg
        } else {
            self.image = phImg
            let ss = UIImageView()
            ss.kf.indicatorType = .activity
        }
    }
}

extension UIImage {
    class func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
