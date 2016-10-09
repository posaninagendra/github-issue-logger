//
//  Helper.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/9/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import UIKit
import JLToast


struct Helper {
    static func makeToast(message: String){
        let toast : JLToast = JLToast.makeText(message,duration:JLToastDelay.LongDelay)
        toast.show()
    }
    
    static func addBackButton(viewController: UIViewController, action: Selector){
        let button = UIButton(frame:CGRect(x:0, y:0, width:40, height:40))
        button.imageEdgeInsets = UIEdgeInsetsMake(0,-25,0,0)
        button.addTarget(viewController, action:action, forControlEvents:.TouchUpInside)
        button.setImage(UIImage(named:"back"), forState: .Normal)
        let barButton = UIBarButtonItem(customView: button)
        
        viewController.navigationItem.leftBarButtonItem = barButton
    }
    
    static func heightForText(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
    }

}