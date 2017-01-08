//
//  CheckBox.swift
//  VDOIT4U
//
//  Created by Guri Bambhrah on 23/06/16.
//  Copyright © 2016 VDoIt4U. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
        // Images
        let checkedImage = UIImage(named: "checked-checkbox-xxl")! as UIImage
        let uncheckedImage = UIImage(named: "unchecked_checkbox")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: UIControlState())
                } else {
                    self.setImage(uncheckedImage, for: UIControlState())
                }
            }
        }
        
        override func awakeFromNib() {
            self.addTarget(self, action: #selector(CheckBox.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
            self.isChecked = false
        }
        
        func buttonClicked(_ sender: UIButton) {
            if sender == self {
                isChecked = !isChecked
            }
        }
}
