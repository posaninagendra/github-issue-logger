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
    
    @IBOutlet weak var getRepoBtn: UIButton!
    
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
        let cont = StoryboardManager.Home.instantiateViewControllerWithIdentifier(AppConstants.List.controller) as! ListController
        cont.isRepoList = true
        cont.apiKey = self.urlField.text
        cont.title = self.urlField.text
        self.navigationController?.pushViewController(cont, animated: true)
    }
}


extension HomeController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.getRepoBtn.sendActionsForControlEvents(.TouchUpInside)
        return true
    }
}