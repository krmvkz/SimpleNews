//
//  SpinnerViewModel.swift
//  SimpleNews
//
//  Created by balaTTV on 06.05.2022.
//

import Foundation
import UIKit

// - MARK: SpinnerViewModel
struct SpinnerViewModel {
    
    let child = SpinnerViewController()
    
}

// - MARK: Methods
extension SpinnerViewModel {
    
    func createSpinnerView(in vc: UIViewController) {
        vc.addChild(child)
        child.view.frame = vc.view.frame
        vc.view.addSubview(child.view)
        child.didMove(toParent: vc)
        debugPrint("Spinner animating")
    }
    
    func removeSpinnerView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            debugPrint("Spinner stopped")
        }
    }
    
}
