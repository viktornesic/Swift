//
//  CronozNavigationController.swift
//  Cronoz
//
//  Created by viktor on 8/10/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class CronozNavigationController: UINavigationController {
    var menuBgView: UIView!
    var menuView: SideMenuViewController!
    var closeButton: UIButton!
    
    var menuWidth: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBgView = UIView.init(frame: self.view.bounds)
        menuBgView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        closeButton = UIButton.init(frame: CGRect(x: self.view.bounds.size.width - 60, y: 13, width: 40, height: 40))
        closeButton.setImage(#imageLiteral(resourceName: "icoClose"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
        menuBgView.addSubview(closeButton)
        
        menuWidth = self.view.frame.size.width - 70
        
        menuView = self.storyboard?.instantiateViewController(withIdentifier: "SideMenu") as! SideMenuViewController
        menuView.view.frame = CGRect(x: menuWidth * -1, y: 0, width: menuWidth, height: self.view.frame.size.height)
    }
    
    func showMenu() {
        menuBgView.alpha = 0
        menuBgView.isHidden = false
        menuView.view.isHidden = false
        
        self.topViewController?.addChildViewController(menuView)
        self.topViewController?.view.addSubview(menuBgView)
        self.topViewController?.view.addSubview(menuView.view)
        
        UIView.animate(withDuration: 0.3) {
            self.menuBgView.alpha = 1
            self.menuView.view.frame = CGRect(x: 0, y: 0, width: self.menuWidth, height: self.view.frame.size.height)
        }
    }
    
    func closeMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuBgView.alpha = 0
            self.menuView.view.frame = CGRect(x: self.menuWidth * -1, y: 0, width: self.menuWidth, height: self.view.frame.size.height)
        }, completion: {
            (value: Bool) in
            self.menuView.view.removeFromSuperview()
            self.menuView.removeFromParentViewController()
            self.menuBgView.removeFromSuperview()
        })
    }

}
