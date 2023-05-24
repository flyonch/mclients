//
//  tokenModel.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
import ObjectMapper

//struct tokenModel : Mappable {
//    var accessToken : String?
//    var refreshToken : String?
//    var userId : Int?
//    var email : String?
//    var user_fullname : String?
//    var userrole : Int?
//    var avatarurl : String?
//    var isactivated : Bool?
//
//    init?(map: Map) {
//
//    }
//
//    mutating func mapping(map: Map) {
//
//        accessToken <- map["accessToken"]
//        refreshToken <- map["refreshToken"]
//        userId <- map["userId"]
//        email <- map["email"]
//        user_fullname <- map["user_fullname"]
//        userrole <- map["userrole"]
//        avatarurl <- map["avatarurl"]
//        isactivated <- map["isactivated"]
//    }
//
//}

struct tokenModel : Codable {
    let accessToken : String?
    let refreshToken : String?
    let userId : Int?
    let email : String?
    let user_fullname : String?
    let userrole : Int?
    let avatarurl : String?
    let isactivated : Bool?

    enum CodingKeys: String, CodingKey {

        case accessToken = "accessToken"
        case refreshToken = "refreshToken"
        case userId = "userId"
        case email = "email"
        case user_fullname = "user_fullname"
        case userrole = "userrole"
        case avatarurl = "avatarurl"
        case isactivated = "isactivated"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
        refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        user_fullname = try values.decodeIfPresent(String.self, forKey: .user_fullname)
        userrole = try values.decodeIfPresent(Int.self, forKey: .userrole)
        avatarurl = try values.decodeIfPresent(String.self, forKey: .avatarurl)
        isactivated = try values.decodeIfPresent(Bool.self, forKey: .isactivated)
    }

}
