//
//  LoginView.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 20/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

enum LoginFlow: Event {
    case finish
}

class LoginView: UIViewController {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginTxtFieldLayoutX: NSLayoutConstraint!
    @IBOutlet weak var passwordTxtFieldLayoutX: NSLayoutConstraint!
    
    var coordinator: Coordinator?
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: LoginView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.layer.cornerRadius = 8
        self.loginButton.layer.masksToBounds = true
        self.loginButton.alpha = 0
        self.loginTxtFieldLayoutX.constant += UIScreen.main.bounds.width
        self.passwordTxtFieldLayoutX.constant += UIScreen.main.bounds.width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.loginTxtFieldLayoutX.constant = 24
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseOut, animations: {
            self.passwordTxtFieldLayoutX.constant = 24
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseOut, animations: {
            self.loginButton.alpha = 1
        }, completion: nil)
    }
    
    var count = 0
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        guard count == 0 else {
            self.coordinator?.handle(LoginFlow.finish)
            return
        }
        
        let bounds = sender.bounds
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseIn, animations: {
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.count = 1
        }, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
