//
//  SpinnerViewController.swift
//  SimpleNews
//
//  Created by balaTTV on 06.05.2022.
//

import Foundation
import UIKit

// - MARK: SpinnerViewController
class SpinnerViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView.init(style: .large)

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.2)

        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}

