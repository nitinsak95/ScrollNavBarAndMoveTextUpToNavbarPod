//
//  ViewController.swift
//  ScrollNavbarr
//
//  Created by AFFIXUS IMAC1 on 9/21/18.
//  Copyright © 2018 AFFIXUS IMAC1. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var customFooter: UIView!
    @IBOutlet weak var tableView: UITableView!
    var names = ["Messi", "Ronaldo", "Pogba", "Suarez", "Juan", "Umtiti", "Neymar", "Benzema", "Chhetri", "Torres", "Kompany", "Rooney", "Zlatan", "Modric", "Lukaku", "Drogba", "Henry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Player Names"
        
//        navigationController?.navigationBar.prefersLargeTitles = true
//        tableView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 100, right: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(tableView, delay: 50.0, followers: [NavigationBarFollower(view: customFooter, direction: .scrollUp)])
             navigationController.scrollingNavbarDelegate = self
//            navigationController.scrollingNavbarDelegate = self
//            navigationController.expandOnActive = false
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.lbPlayerName.text = names[indexPath.row]
        return cell
    }


    
}
extension ViewController: ScrollingNavigationControllerDelegate {
    func scrollingNavigationController(_ controller: ScrollingNavigationController, willChangeState state: NavigationBarState) {
        view.needsUpdateConstraints()
    }
}

