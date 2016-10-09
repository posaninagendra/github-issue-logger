//
//  UserRepo.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift


class UserRepo: Mappable{

    var name: String?
    var fullName: String?
    var privateRepo: Bool?
    var createdAt: String?
    var forksCount: Int?
    var openIssuesCount: Int?
    var message : String?
    var fork: Bool?
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    static func mappedUserRepoResponse(dict:[Dictionary<String,AnyObject>]) -> [UserRepo]{
        return Mapper<UserRepo>().mapArray(dict)! as [UserRepo]
    }
    
    func mapping(map: Map) {
        message <- map["message"]
        name <- map["name"]
        fullName <- map["full_name"]
        privateRepo <- map["private"]
        createdAt <- map["created_at"]
        forksCount <- map["forks_count"]
        openIssuesCount <- map["open_issues_count"]
        fork <- map["fork"]
    }
}
