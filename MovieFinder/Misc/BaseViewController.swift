//
//  BaseViewController.swift
//  MovieFinder
//
//  Created by Gareth Lloyd on 22/11/2021.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    var loadingSpinner: NVActivityIndicatorView?
    
    func showPleaseWait() {
        if self.loadingSpinner == nil {
            let currentFrame = self.view.frame
            let x = (currentFrame.width / 2) - 50
            let y = (currentFrame.height / 2) - 25
            let frame = CGRect.init(x: x, y: y, width: 100, height: 50)
            let loadingSpinner = NVActivityIndicatorView(frame: frame, type: .ballPulseSync, color: .blue, padding: 0)
            
            self.view.addSubview(loadingSpinner)
            self.loadingSpinner = loadingSpinner
        }
        self.loadingSpinner?.startAnimating()
    }
    
    func hidePleaseWait() {
        self.loadingSpinner?.stopAnimating()
    }
}
