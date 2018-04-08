//
//  SideMenuViewController.swift
//  Cronoz
//
//  Created by viktor on 8/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    
    let iconNamesArray = ["icoReservation", "icoFavorite", "icoPromotion", "icoSettings", "icoQuestion", "icoSupport", "icoLogout"]
    let menuTitlesArray = ["My Reservations", "Favorite Hotels", "Promotion Code", "Settings", "FAQ", "Support", "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.backgroundView = nil
        menuTableView.backgroundColor = UIColor.init(white: 1, alpha: 0.7)
        
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        photoImageView.layer.borderWidth = 2
        photoImageView.layer.borderColor = nameLabel.textColor.cgColor        
    }
    
    // MARK: UITableView DataSource
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuTableViewCell
        
        cell.iconImageView.image = UIImage.init(named: iconNamesArray[indexPath.row])
        cell.menuTitleLabel.text = menuTitlesArray[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
