//
//  Coordinate.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 21/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import Foundation

protocol Event { }

protocol Coordinator: class {
    func start()
    func handle(_ action: Event)
    var parentCoordinator: Coordinator? { get set }
}

extension Coordinator where Self: Coordinator {
    var parentCoordinator: Coordinator? {
        return nil
    }
}
