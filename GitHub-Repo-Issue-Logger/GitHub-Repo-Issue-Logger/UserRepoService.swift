//
//  UserRepoService.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation

extension UserRepo{
    static func getUserRepos(username: String, completion:(result:[UserRepo]?, error: NSError?) -> Void) {
        API.request(.UserRepos(username)) {response in
            if response.result.error != nil {
                completion(result: nil, error: response.result.error!)
            }else {
                if let JSON = response.result.value as? [[String : AnyObject]]{
                    let temp = UserRepo.mappedUserRepoResponse(JSON)
                    completion(result: temp, error: nil)
                }
            }
        }
    }
}