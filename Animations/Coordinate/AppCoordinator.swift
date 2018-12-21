//
//  AppCoordinate.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 21/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    let window: UIWindow
    var currentView: UIViewController!
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        startMainView()
    }
    
    private func startMainView() {
        let mainView = MainView(coordinator: self)
        self.currentView = mainView
        self.window.rootViewController = mainView
        self.window.makeKeyAndVisible()
    }
    
    private func startBasicView() {
        let basicCoordinator = BasicCoordinator(window: self.window, parentCoordinator: self, previousView: currentView)
        basicCoordinator.start()
    }
    
    private func startReplacing() {
        let replacingCoordinator = ReplacingCoordinator(window: self.window, parentCoordinator: self, previousView: currentView)
        replacingCoordinator.start()
    }
}


extension AppCoordinator {
    func handle(_ action: Event) {
        switch action {
        case MainFlow.basic:
            self.startBasicView()
        case MainFlow.replacing:
            self.startReplacing()
        default:
            break
        }
    }
}
