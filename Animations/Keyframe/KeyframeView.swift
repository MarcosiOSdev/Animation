//
//  KeyframeView.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 24/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

class KeyframeView: UIViewController {

    var coordinator: Coordinator!
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: KeyframeView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
