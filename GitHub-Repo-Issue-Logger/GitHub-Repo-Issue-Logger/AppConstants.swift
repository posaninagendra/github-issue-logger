//
//  AppConstants.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
    
    struct Home {
        static let controller: String = "HomeController"
        static let name: String = "Issue Logger"
    }
    
    struct List {
        static let controller: String = "ListController"
        static let repoList: String = "RepoListCell"
        static let issueList: String = "IssueListCell"
        static let repoCellHeight: CGFloat = 90.0
        static let issueCellHeight: CGFloat = 63.0
    }
}