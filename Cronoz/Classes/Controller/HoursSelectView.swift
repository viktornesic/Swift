//
//  HoursSelectView.swift
//  Cronoz
//
//  Created by viktor on 8/10/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

import PickerView

protocol HoursSelectDelegate {
    func hoursSelected(hours: Int)
}

class HoursSelectView: UIView, PickerViewDataSource, PickerViewDelegate {
    
    @IBOutlet weak var hourPickerView: PickerView!
    
    open var delegate: HoursSelectDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        hourPickerView.dataSource = self
        hourPickerView.delegate = self
    }
    
    // MARK: UI Events
    
    @IBAction func onNext(_ sender: Any) {
        if self.delegate != nil {
            self.delegate?.hoursSelected(hours: hourPickerView.currentSelectedRow + 1)
        }
    }
    
    // MARK: PickerView Delegate
    
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        return 24
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        return "\(index + 1)"
    }
    
    func pickerView(_ pickerView: PickerView, styleForLabel label: UILabel, highlighted: Bool) {
        label.textAlignment = .center
        if (highlighted) {
            label.font = UIFont(name: "Bariol-Bold", size: 60.0)
        } else {
            label.font = UIFont(name: "Bariol-Bold", size: 50.0)
        }
        
        if (highlighted) {
            label.textColor = UIColor.init(rgb: 0x969696)
        } else {
            label.textColor = UIColor.init(rgb: 0x969696).withAlphaComponent(0.6)
        }
    }
    
    func pickerView(_ pickerView: PickerView, viewForRow row: Int, index: Int, highlighted: Bool, reusingView view: UIView?) -> UIView? {
        
        return nil
    }
    
    func pickerViewHeightForRows(_ pickerView: PickerView) -> CGFloat {
        return 60
    }
    
}
