//
//  IssueListCell.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/9/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import UIKit

class IssueListCell: UITableViewCell {

    @IBOutlet weak var createdByLabel: UILabel!
    @IBOutlet weak var issueName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(issue:RepoIssue){
        self.issueName.text = issue.name
        self.createdByLabel.text = "Created by " + (issue.user?.name)! + " on " + NSDate().getDisplayTime(issue.createdAt!)
    }
}
