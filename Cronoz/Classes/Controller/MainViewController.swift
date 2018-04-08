//
//  MainViewController.swift
//  Cronoz
//
//  Created by viktor on 8/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit
import MapKit

import iCarousel
import PickerView

class MainViewController: UIViewController, UITextFieldDelegate, iCarouselDelegate, iCarouselDataSource, HotelItemViewDelegate, HoursSelectDelegate, DateSelectDelegate, TimeSelectDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var bookListView: iCarousel!
    @IBOutlet weak var hotelMapView: MKMapView!
    
    var darkView: UIView!
    var filterView: FilterView!
    var hoursView: HoursSelectView!
    var timeView: TimePickerView!
    var dateView: DateSelectView!
    var tapGesture: UITapGestureRecognizer!
    var curPopupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchContainerView.clipsToBounds = true
        searchContainerView.layer.cornerRadius = 15
        
        darkView = UIView.init(frame: self.view.bounds)
        darkView.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        
        bookListView.type = .linear
        
        hotelMapView.showsUserLocation = true
    }
    
    // MARK: Search Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.text = ""
        searchTextField.placeholder = ""
        searchButton.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 0.3, animations: {
            self.searchContainerView.frame = self.searchButton.frame
        }, completion: {
            (value: Bool) in
            self.filterButton.isHidden = false
        })
        
        return textField.resignFirstResponder()
    }
    
    // MARK: iCarousel Delegate
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 10
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var hotelView : HotelItemView
        if view == nil {
            hotelView = UINib(nibName: "HotelItemView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HotelItemView
            hotelView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 80, height: 180)
        } else {
            hotelView = view as! HotelItemView
        }
        
        hotelView.tag = index
        hotelView.delegate = self
        
        return hotelView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == .spacing {
            return value * 1.1
        }
        
        return value
    }
    
    func viewHotelDetail(index: Int) {
        self.performSegue(withIdentifier: "HotelDetail", sender: nil)
    }
    
    func bookHotel(index: Int) {
        self.showPopupView(view: nil)
        self.performSegue(withIdentifier: "WizardView", sender: nil)
    }
    
    // MARK: UI Events
    
    @IBAction func onMenuClicked(_ sender: Any) {
        (self.navigationController as! CronozNavigationController).showMenu()
    }
    
    @IBAction func onSearch(_ sender: Any) {
        filterButton.isHidden = true
        searchButton.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.3, animations: {
            self.searchContainerView.frame = CGRect(x: 25, y: 58, width: self.searchButton.frame.origin.x + 5, height: 30)
        }, completion: {
            (value: Bool) in
            self.searchTextField.text = ""
            self.searchTextField.placeholder = "Change the location"
            self.searchTextField.becomeFirstResponder()
        })
    }

    @IBAction func onFilterClicked(_ sender: Any) {
        if filterView == nil {
            filterView = UINib(nibName: "FilterView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! FilterView
        }
        
        self.showPopupView(view: filterView)
    }
    
    func hoursSelected(hours: Int) {
        self.dismissPopupView()
    }
    
    func dateSelected(hours: Int) {
        self.dismissPopupView()
    }
    
    func timeSelected(hours: Int) {
        self.dismissPopupView()
    }
    
    func showPopupView (view: UIView?) {
        darkView.alpha = 0
        self.view.addSubview(darkView)

        if view != nil {
            curPopupView = view;
            view!.center = CGPoint(x: self.view.center.x, y: self.view.frame.size.height + view!.frame.size.height / 2 + 50)
            
            tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(dismissPopupView))
            darkView.addGestureRecognizer(tapGesture)
            self.view.addSubview(view!)
        }
        
        UIView.animate(withDuration: 0.3) {
            if view != nil {
                view!.center = CGPoint(x: self.view.center.x, y: self.view.frame.size.height - view!.frame.size.height / 2 - 50)
            }
            self.darkView.alpha = 1
        }
    }
    
    func dismissPopupView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.darkView.alpha = 0
            self.curPopupView.center = CGPoint(x: self.view.center.x, y: self.view.frame.size.height + self.curPopupView.frame.size.height / 2 + 50)
        }, completion: {
            (value: Bool) in
            self.darkView.removeFromSuperview()
            self.curPopupView.removeFromSuperview()
            self.darkView.removeGestureRecognizer(self.tapGesture)
        })
    }
    
}
