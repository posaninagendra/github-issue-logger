//
//  API.swift
//  GitHub-Repo-Issue-Logger
//
//  Created by Hirva Shah on 10/8/16.
//  Copyright © 2016 Nagendra Posani. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

public class API{

    enum ServerConfig: String{
        case baseUrl = "https://api.github.com/"
        case userRepos = "users/"
        case open = "/issues?state=open"
        case closed = "/issues?state=closed"
    }
    
    public enum Endpoints{
        case OpenIssues(String)
        case ClosedIssues(String)
        case UserRepos(String)
        public var path: String{
            switch self {
            case .OpenIssues(let keywords) :
                return ServerConfig.baseUrl.rawValue + "repos/" + keywords + ServerConfig.open.rawValue
            case .ClosedIssues(let keywords):
                return ServerConfig.baseUrl.rawValue + "repos/" + keywords + ServerConfig.closed.rawValue
            case .UserRepos(let keywords):
                return ServerConfig.baseUrl.rawValue + ServerConfig.userRepos.rawValue + keywords + "/repos"
                
            }
        }
        public var method: Alamofire.Method {
            return Alamofire.Method.GET
        }
    }
    
    public static func request(endpoints: API.Endpoints, completionHandler: Response<AnyObject, NSError> -> Void) -> Request {
        let request = Alamofire.Manager.sharedInstance.request(
            endpoints.method,
            endpoints.path,
            parameters: nil,
            encoding: .JSON,
            headers: nil
            ).responseJSON{ response in
                completionHandler(response)
        }
        return request
    }
}