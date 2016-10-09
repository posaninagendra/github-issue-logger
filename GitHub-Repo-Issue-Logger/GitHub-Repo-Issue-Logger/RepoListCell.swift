//
//  RepoListCell.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/9/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import UIKit

class RepoListCell: UITableViewCell {

    @IBOutlet weak var issueLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var repoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(repoCell: UserRepo){
        self.repoName.text = repoCell.name
        self.ownerLabel.text = "Created at " + NSDate().getDisplayTime(repoCell.createdAt!)
        self.issueLabel.text = String(repoCell.openIssuesCount!) + " Open Issues"
    }
    
}
