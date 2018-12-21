//
//  ViewController.swift
//  Animations
//
//  Created by Marcos Felipe Souza on 20/12/18.
//  Copyright © 2018 Marcos Felipe Souza. All rights reserved.
//

import UIKit

enum MainFlow: Event {    
    case basic
}

enum TypeOfMenu: Int {
    case basic = 0
    case replacing, transition, keyframing
}

class MainView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let menuList = ["Basic", "Replacing", "KeyFraming Animation"]
    weak var coordinator: Coordinator?
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: String(describing: MainView.self), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}


extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = TypeOfMenu(rawValue: indexPath.row)
        switch type {
        case .basic?:
            self.coordinator?.handle(MainFlow.basic)
        case .replacing?:
            self.present(ReplaceView(), animated: true, completion: nil)
        default:
            self.coordinator?.handle(MainFlow.basic)
        }        
    }
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuList[indexPath.row]
        return cell
    }
}
