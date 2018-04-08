//
//  HotelItemView.swift
//  Cronoz
//
//  Created by viktor on 8/10/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

protocol HotelItemViewDelegate {
    func viewHotelDetail(index: Int)
    func bookHotel(index: Int)
}

class HotelItemView: UIView {
    
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var priceLabel1: UILabel!
    @IBOutlet weak var priceLabel2: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoContainerView: UIView!
    
    open var delegate: HotelItemViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoContainerView.clipsToBounds = true
        photoContainerView.layer.cornerRadius = 8
    }

    @IBAction func onHotelClicked(_ sender: Any) {
        self.delegate?.viewHotelDetail(index: self.tag)
    }

    @IBAction func onBookClicked(_ sender: Any) {
        self.delegate?.bookHotel(index: self.tag)
    }

}
