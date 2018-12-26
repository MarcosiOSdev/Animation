//
//  TableviewCoordinator.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 26/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class TableviewCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var currentView: UIViewController?
    let previousView: UIViewController
    let window: UIWindow
    var navigationController: UINavigationController?
    
    init(window: UIWindow, parentCoordinator: Coordinator, previousView: UIViewController){
        self.parentCoordinator = parentCoordinator
        self.window = window
        self.previousView = previousView
    }
    
    func start() {
        self.currentView = TableviewView(coordinator: self)
        self.navigationController = UINavigationController()
        navigationController?.pushViewController(currentView!, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        currentView?.title = "Animation View"
        let dismissButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismiss))
        currentView?.navigationItem.leftBarButtonItems = [dismissButton]
        previousView.present(navigationController!, animated: true, completion: nil)
    }
    
    @objc func dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension TableviewCoordinator {
    func handle(_ action: Event) {
        switch action {
        case TableviewFlow.finish:
            self.dismiss()
        default:
            self.dismiss()
        }
        
    }
}
