//
//  SingletonClass.swift
//  VDOIT4U
//
//  Created by Guri Bambhrah on 21/06/16.
//  Copyright © 2016 VDoIt4U. All rights reserved.
//

import UIKit

class SingletonClass: NSObject {
    
    var username : NSString!
    
    static let sharedInstance = SingletonClass()
    
    fileprivate override init() {}
}
