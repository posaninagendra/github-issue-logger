//
//  DateExtension.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/9/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import UIKit

extension NSDate{
    func getDisplayTime(date:String) -> String{
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let givenDate = formatter.dateFromString(date)
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.stringFromDate(givenDate!)
    }
}