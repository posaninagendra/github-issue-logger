//
//  RepoIssue.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/9/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class RepoIssue: Mappable{

    var name: String?
    var user: IssueUser?
    var createdAt: String?
    var comments: Int?
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    static func mappedRepoIssueResponse(dict:[Dictionary<String,AnyObject>]) -> [RepoIssue]{
        return Mapper<RepoIssue>().mapArray(dict)! as [RepoIssue]
    }
    
    func mapping(map: Map) {
        name <- map["title"]
        user <- map["user"]
        createdAt <- map["created_at"]
        comments <- map["comments"]
    }

}

class IssueUser: Mappable{
    
    var name: String?
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["login"]
    }
}