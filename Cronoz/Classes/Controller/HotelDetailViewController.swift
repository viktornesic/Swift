//
//  HotelDetailViewController.swift
//  Cronoz
//
//  Created by viktor on 8/8/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class HotelDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.rowHeight = UITableViewAutomaticDimension
        detailTableView.estimatedRowHeight = 55;
    }
    
    // MARK: UI Events
    
    @IBAction func onMenuClicked(_ sender: Any) {
        (self.navigationController as! CronozNavigationController).showMenu()
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: UITableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedCell")
            return cell!
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell")
            return cell!
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell")
            return cell!
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NearCell")
            return cell!
        } else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookButtonCell")
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell")
            return cell!
        }
    }
}
