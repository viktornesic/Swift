//
//  TimePickerView.swift
//  Cronoz
//
//  Created by viktor on 9/4/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

import PickerView

protocol TimeSelectDelegate {
    func timeSelected(hours: Int)
}

class TimePickerView: UIView, PickerViewDelegate, PickerViewDataSource {
    
    @IBOutlet weak var hourPickerView: PickerView!
    @IBOutlet weak var minPickerView: PickerView!
    
    open var delegate: TimeSelectDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        hourPickerView.dataSource = self
        hourPickerView.delegate = self
        minPickerView.dataSource = self
        minPickerView.delegate = self
    }
    
    // MARK: UI Events
    
    @IBAction func onNext(_ sender: Any) {
        if self.delegate != nil {
            //            self.delegate?.hoursSelected(hours: hourPickerView.currentSelectedRow + 1)
        }
    }
    
    // MARK: PickerView Delegate
    
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        if pickerView == hourPickerView {
            return 24
        } else {
            return 2
        }
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        if pickerView == hourPickerView {
            return String(format: "%02d", arguments: [row])
        } else {
            if row == 0 {
                return "00"
            } else {
                return "30"
            }
        }
    }
    
    func pickerView(_ pickerView: PickerView, styleForLabel label: UILabel, highlighted: Bool) {
        label.textAlignment = .center
        if (highlighted) {
            label.font = UIFont(name: "Bariol-Bold", size: 40.0)
        } else {
            label.font = UIFont(name: "Bariol-Bold", size: 30.0)
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
