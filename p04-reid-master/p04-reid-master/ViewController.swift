//
//  ViewController.swift
//  p04-reid-master
//
//  Created by Matthew Reid on 7/3/19.
//  Copyright © 2019 Matthew Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Globals.yVals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "[\(indexPath.row)] = (\(Globals.yVals[indexPath.row])*\(Globals.multiplier)) = \(Globals.yVals[indexPath.row] * Double(Globals.multiplier))"
        return cell
    }
    
}

