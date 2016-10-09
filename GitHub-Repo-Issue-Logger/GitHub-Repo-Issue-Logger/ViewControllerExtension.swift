//
//  ViewControllerExtension.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    override public func resignFirstResponder() -> Bool {
        self.view.endEditing(true)
        return true
    }
    

}