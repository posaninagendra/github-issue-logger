//
//  HomeController.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeController: UIViewController, ResginOnClick {

    // UI Outlets
    @IBOutlet weak var urlField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppConstants.Home.name
        self.resignOnClick(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func issueButtonClick(sender: AnyObject) {
        
    }
    

}
