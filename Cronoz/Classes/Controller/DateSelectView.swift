//
//  DateSelectView.swift
//  Cronoz
//
//  Created by viktor on 9/4/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

import PickerView

protocol DateSelectDelegate {
    func dateSelected(hours: Int)
}


class DateSelectView : UIView, PickerViewDataSource, PickerViewDelegate {
    
    @IBOutlet weak var monthPickerView: PickerView!
    @IBOutlet weak var dayPickerView: PickerView!
    @IBOutlet weak var yearPickerView: PickerView!
    
    let months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
    var currentDate : NSDate!
    
    open var delegate: DateSelectDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        monthPickerView.dataSource = self
        monthPickerView.delegate = self
        dayPickerView.dataSource = self
        dayPickerView.delegate = self
        yearPickerView.dataSource = self
        yearPickerView.delegate = self
        
        currentDate = NSDate()
    }
    
    // MARK: UI Events
    
    @IBAction func onNext(_ sender: Any) {
        if self.delegate != nil {
//            self.delegate?.hoursSelected(hours: hourPickerView.currentSelectedRow + 1)
        }
    }
    
    // MARK: PickerView Delegate
    
    func pickerViewNumberOfRows(_ pickerView: PickerView) -> Int {
        if pickerView == monthPickerView {
            return 12
        } else if pickerView == dayPickerView {
            return 31
        } else {
            return 10
        }
    }
    
    func pickerView(_ pickerView: PickerView, titleForRow row: Int, index: Int) -> String {
        if pickerView == monthPickerView {
            return months[row]
        } else if pickerView == dayPickerView {
            return "\(row + 1)"
        } else {
            return "\(2017 + row)"
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
