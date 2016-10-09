//
//  ListController.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import UIKit
import SVProgressHUD


class ListController: UIViewController {

    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    var isRepoList: Bool?
    var apiKey: String?
    var repoList:[UserRepo] = []
    var issueList:[RepoIssue] = []
    var openIssues: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.errorView.hidden = true
        Helper.addBackButton(self, action: #selector(ListController.popToRoot))
        self.setUpTableView()
        if self.isRepoList == true {
            SVProgressHUD.show()
            self.getRepoData()
        }else if self.openIssues != nil{
            if self.openIssues > 0{
                SVProgressHUD.show()
                self.errorView.hidden = false
                self.view.bringSubviewToFront(self.listTableView)
                self.getIssueListData()
                
            }else{
                self.errorView.hidden = false
                self.view.bringSubviewToFront(self.errorView)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.dismiss()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func popToRoot(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func setUpTableView(){
        self.listTableView.hidden = true
        self.listTableView.registerNib(UINib(nibName:AppConstants.List.repoList, bundle: nil) , forCellReuseIdentifier: AppConstants.List.repoList)
        self.listTableView.registerNib(UINib(nibName: AppConstants.List.issueList, bundle: nil), forCellReuseIdentifier: AppConstants.List.issueList)
        self.listTableView.tableFooterView = UIView()
    }
    
    func getRepoData(){
        UserRepo.getUserRepos(self.apiKey!) { (result, error) in
            SVProgressHUD.dismiss()
            if error == nil {
                self.repoList = result!
                if result?.count > 0 {
                    self.listTableView.hidden = false
                    self.listTableView.delegate = self
                    self.listTableView.dataSource = self
                    self.listTableView.reloadData()
                }else{
                    self.errorView.hidden = false
                }
                
            }else{
                Helper.makeToast("Network Error")
            }
        }
    }
    
    func getIssueListData(){
        RepoIssue.getRepoIssues(self.apiKey!) { (result, error) in
            SVProgressHUD.dismiss()
            if error == nil {
                self.listTableView.hidden = false
                self.listTableView.delegate = self
                self.listTableView.dataSource = self
                self.issueList = result!
                self.listTableView.reloadData()
                
            }else{
                Helper.makeToast("Network Error")
            }
        }
    }
}

extension ListController : UITableViewDelegate{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if self.isRepoList == true{
            return AppConstants.List.repoCellHeight
        }
        
        return Helper.heightForText(self.issueList[indexPath.row].name!, font: UIFont.systemFontOfSize(17), width: 300) + 40
    }
}


extension ListController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.isRepoList == true{
            return (self.repoList.count)
        }
        return (self.issueList.count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if self.isRepoList == true{
            let cell = tableView.dequeueReusableCellWithIdentifier(AppConstants.List.repoList, forIndexPath: indexPath) as! RepoListCell
            cell.accessoryType = .DisclosureIndicator
            cell.selectionStyle = .None
            cell.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
            cell.configureCell(self.repoList[indexPath.row])
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(AppConstants.List.issueList, forIndexPath: indexPath) as! IssueListCell
            cell.selectionStyle = .None
            cell.configureCell(self.issueList[indexPath.row])
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if self.isRepoList == true{
            let cont = StoryboardManager.Home.instantiateViewControllerWithIdentifier(AppConstants.List.controller) as! ListController
            cont.isRepoList = false
            cont.apiKey = self.repoList[indexPath.row].fullName
            cont.title = "Open Issues"
            cont.openIssues = self.repoList[indexPath.row].openIssuesCount
            self.navigationController?.pushViewController(cont, animated: true)
        }
    }
}
