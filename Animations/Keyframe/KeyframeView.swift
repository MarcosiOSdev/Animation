//
//  KeyframeView.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 24/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

enum KeyframeFlow: Event {
    case finish
}

class KeyframeView: UIViewController {

    var coordinator: Coordinator!
    var alertView: UIView!
    let closedButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("X", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(dismissCoordinator), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: KeyframeView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createView()
        self.setupCloseButton()
    }
    
    func setupCloseButton() {
        self.view.addSubview(self.closedButton)
        let constraints = [
            closedButton.widthAnchor.constraint(equalToConstant: 50),
            closedButton.heightAnchor.constraint(equalToConstant: 50),
            closedButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            closedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func createView() {
        
        let screenWidth = UIScreen.main.bounds.width
        // Create a red view
        let alertWidth: CGFloat = screenWidth
        let alertHeight: CGFloat = view.bounds.height
        let alertViewFrame: CGRect = CGRect(x: 0, y: 0, width: alertWidth, height: alertHeight)
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = .red
        
        // Create an image view and add it to this view
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: alertWidth, height: alertHeight/2))
        imageView.image = UIImage(named: "01")
        alertView.addSubview(imageView)
        
        // Create a button and set a listener on it for when it is tapped. Then the button is added to the alert view
        let button = UIButton(type: UIButton.ButtonType.system) as UIButton
        button.setTitle("Dismiss", for: .normal)
        button.backgroundColor = UIColor.white
        let buttonWidth: CGFloat = alertWidth/2
        let buttonHeight: CGFloat = 40
        let buttonX: CGFloat = alertView.center.x - buttonWidth/2.0
        let buttonY: CGFloat = alertView.center.y - buttonHeight/2.0
        button.frame = CGRect(x: buttonX,
                              y: buttonY,
                              width: buttonWidth,
                              height: buttonHeight)
        
        button.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        alertView.addSubview(button)
        view.addSubview(alertView)
    }
    
    @objc func dismissCoordinator() {
        self.coordinator.handle(KeyframeFlow.finish)
    }
    
    @objc func dismissAlert() {
        let bounds = alertView.bounds
        let smallFrame: CGRect = alertView.bounds.insetBy(dx: alertView.frame.size.width / 4, dy: bounds.size.height / 4)
        let finalFrame: CGRect = smallFrame.offsetBy(dx: 0, dy: UIScreen.main.bounds.height)
        
        //Os filhos fazem as mesmas animacoes que o pai
        //Pq eh criado um snapshot de tudo ( logo tudo vira uma imagem )
        guard let snapshot = alertView.snapshotView(afterScreenUpdates: false) else { return }
        snapshot.frame = alertView.frame
        view.addSubview(snapshot)
        alertView.removeFromSuperview()
        
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                snapshot.frame = smallFrame
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                snapshot.frame = finalFrame
            }
        }, completion: nil)
        
        
    }
    
}
