//
//  MenuTableViewCell.swift
//  Cronoz
//
//  Created by viktor on 8/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var menuTitleLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.alpha = selected ? 0.7 : 1
            })
        } else {
            self.alpha = selected ? 0.7 : 1
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.alpha = highlighted ? 0.7 : 1
            })
        } else {
            self.alpha = highlighted ? 0.7 : 1
        }
    }
}
