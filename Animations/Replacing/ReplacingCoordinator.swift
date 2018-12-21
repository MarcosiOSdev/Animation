//
//  ReplacingCoordinator.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 21/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class ReplacingCoordinator: Coordinator {
    var parentCoordinator: Coordinator?    
    let window: UIWindow
    var previousView: UIViewController
    var currentView: UIViewController?
    
    init(window: UIWindow, parentCoordinator: Coordinator, previousView: UIViewController) {
        self.window = window
        self.parentCoordinator = parentCoordinator
        self.previousView = previousView
    }
    
    func start() {
        self.currentView = ReplaceView(coordinator: self)
        self.previousView.present(self.currentView!, animated: true, completion: nil)
    }
    
    private func dismiss() {
        self.currentView!.dismiss(animated: true, completion: nil)
    }
    
}

extension ReplacingCoordinator {
    func handle(_ action: Event) {
        switch action {
        case ReplaceFlow.finish:
            self.dismiss()
        default:
            self.dismiss()
        }
    }
}
