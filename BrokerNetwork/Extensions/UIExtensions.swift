//
//  UIExtensions.swift
//  BrokerNetwork
//
//  Created by neosoft on 18/04/22.
//

import UIKit

extension UITextField{
    
    @nonobjc func setRightView(image: UIImage){
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        containerView.addSubview(imageView)
        imageView.center = containerView.center
        
        rightView = containerView
        rightViewMode = .always
        
        if let placeHolder = placeholder{
            attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    }
}

extension UIColor{
    @nonobjc class var casualBlack: UIColor{
        return UIColor(red: 23/255, green: 23/255, blue: 23/255, alpha: 1.0)
    }
}
