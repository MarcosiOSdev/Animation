//
//  ReplaceView.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 21/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

enum ReplaceFlow: Event {
    case finish
}

class ReplaceView: UIViewController {

    @IBOutlet weak var closerButton: UIButton!
    var coordinator: Coordinator?
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: ReplaceView.self), bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let firstImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "01"))
        imageView.frame = UIScreen.main.bounds
        return imageView
    }()
    
    let secondImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "02"))
        imageView.frame = UIScreen.main.bounds
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.insertSubview(firstImage, belowSubview: self.closerButton)
        imageFadeIn(imageView: firstImage)
    }
    
    func imageFadeIn(imageView: UIImageView) {
        
        secondImage.alpha = 0.0
        view.insertSubview(secondImage, aboveSubview: imageView)
        
        UIView.animate(withDuration: 3.0, delay: 1, options: [.curveEaseOut, .repeat], animations: {
            self.secondImage.alpha = 1.0
        }, completion: {_ in
            imageView.image = self.secondImage.image
            self.secondImage.removeFromSuperview()
        })
        
    }
    
    fileprivate func setBlurEffect() {
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        self.view.addSubview(blurEffectView)
    }
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        self.coordinator?.handle(ReplaceFlow.finish)
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
