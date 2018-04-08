//
//  FilterView.swift
//  Cronoz
//
//  Created by viktor on 8/9/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class FilterView: UIView {
    
    let iconNameArray = ["icoWifi", "icoAirConditioner", "icoEssentials", "icoRestaurant", "icoBar", "icoSwimmingPool"]
    
    @IBOutlet var featureViewArray: [UIView]!
    @IBOutlet var featuredImageArray: [UIImageView]!
    @IBOutlet var featuredTitleArray: [UILabel]!
    @IBOutlet var filterButtonArray: [UIButton]!
    
    override func awakeFromNib() {
        for index in 0...5 {
            let imageView = featuredImageArray[index]
            imageView.image = UIImage.init(named: iconNameArray[index])?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = UIColor.init(rgb: 0xaaaaaa)
            
            let titleLabel = featuredTitleArray[index]
            titleLabel.textColor = UIColor.init(rgb: 0xaaaaaa)
            
            let button = filterButtonArray[index]
            button.addTarget(self, action: #selector(onOptionClicked(_:)), for: .touchUpInside)
            button.tag = index
        }
    }
    
    func onOptionClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        let imageView = featuredImageArray[sender.tag]
        
        if sender.isSelected {
            UIView.animate(withDuration: 0.3, animations: {
                imageView.backgroundColor = UIColor.init(rgb: 0xebebeb)
                imageView.tintColor = UIColor.init(rgb: 0x6b007f)
            })
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                imageView.backgroundColor = UIColor.clear
                imageView.tintColor = UIColor.init(rgb: 0xaaaaaa)
            })
        }
    }
}
