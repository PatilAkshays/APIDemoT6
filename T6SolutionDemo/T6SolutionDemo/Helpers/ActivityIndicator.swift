//
//  ActivityIndicator.swift
//  T6SolutionDemo
//
//  Created by Niid tech on 28/07/18.
//  Copyright © 2018 T6SolutionDemo. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerUtils {
    
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var loadingLabel = UILabel()
    
    open class var shared: ViewControllerUtils {
        struct Static {
            static let instance: ViewControllerUtils = ViewControllerUtils()
        }
        return Static.instance
    }
    
    open func showProgressView(_ view: UIView) {
        containerView.frame = view.frame
        containerView.center = view.center
        //        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
        containerView.backgroundColor = UIColor.clear
        
        progressView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)//80
        progressView.center = view.center
        //        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.backgroundColor = UIColor.black//darkGray
        progressView.alpha = 0.7
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2 - 10)
        
        loadingLabel.frame = CGRect(x: 0, y: progressView.bounds.height - 30, width: progressView.bounds.width, height: 20)
        loadingLabel.text = "Loading..."
        loadingLabel.textAlignment = .center
        loadingLabel.textColor = UIColor.white
        loadingLabel.font = UIFont.systemFont(ofSize: 14)
        
        progressView.addSubview(loadingLabel)
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        
        view.addSubview(containerView)
        
        progressView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.3, animations: {
            self.progressView.transform = CGAffineTransform.identity
        })
        
        UIView.animate(withDuration: 1) {
            self.progressView.alpha = 1
        }
        
        activityIndicator.startAnimating()
    }
    
    open func hideProgressView() {
        activityIndicator.stopAnimating()
        UIView.animate(withDuration: 1, animations: {
        }) { _ in
            self.containerView.alpha = 0.7
            self.containerView.removeFromSuperview()
        }
    }
    
    func toTheCorner(view: UIView, delay: Double)
    {
        // record original position
        let originalCenter = view.center
        // record original bounds
        let b = view.bounds
        
        UIView.animate(withDuration: 0.1, delay: delay, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            
            // move view to center of screen
            view.center.x = self.containerView.bounds.width/2
            view.center.y = self.containerView.bounds.height/2
            
        }, completion: { finished in
            UIView.animate(withDuration: 0.9, delay: delay + 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                
                // Fade image in
                view.alpha = 1.0
                
                // Increase size
                view.bounds.size.height = b.height + b.height/2
                view.bounds.size.width = b.width + b.width/2
                
            }, completion: { finished in
                UIView.animate(withDuration: 0.7, delay: delay + 1.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                    
                    // Shrink to original size
                    view.bounds.size.height = b.height
                    view.bounds.size.width = b.width
                    
                    // Move to original position
                    view.center = originalCenter
                }, completion: nil)})
        })
    }
    
}

extension UIColor {
    
    convenience init(hex: UInt32, alpha: CGFloat) {
        let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hex & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hex & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
