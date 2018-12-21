//
//  BasicCoordinator.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 21/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class BasicCoordinator: Coordinator {
    
    let window: UIWindow
    weak var parentCoordinator: Coordinator?
    var currentView: UIViewController?
    var previousView: UIViewController!
    
    init(window: UIWindow, parentCoordinator: Coordinator?, previousView: UIViewController) {
        self.window = window
        self.parentCoordinator = parentCoordinator
        self.previousView = previousView
    }
    
    func start() {
        let basicView = LoginView(coordinator: self)
        self.currentView = basicView
        self.previousView.present(self.currentView!, animated: true, completion: nil)
    }
}

extension BasicCoordinator {
    func handle(_ action: Event) {
        
    }
}
