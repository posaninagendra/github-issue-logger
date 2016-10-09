//
//  RepoIssueService.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/9/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation


extension RepoIssue{
    static func getRepoIssues(repoName: String, completion:(result:[RepoIssue]?, error: NSError?) -> Void) {
        API.request(.OpenIssues(repoName)) {response in
            if response.result.error != nil {
                completion(result: nil, error: response.result.error!)
            }else {
                if let JSON = response.result.value as? [[String : AnyObject]]{
                    let temp = RepoIssue.mappedRepoIssueResponse(JSON)
                    completion(result: temp, error: nil)
                }
            }
        }
    }
}