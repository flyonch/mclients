//
//  UserDataModel.swift
//  MyClient
//
//  Created by Leonid Fedorov on 11.05.2023.
//

import Foundation
struct UserDataModel : Codable {
    let user_id : Int?
    let user_fullname : String?
    let user_phone : String?
    let user_email : String?
    let avatarurl : String?
    let isactivated : Bool?
    let userrole : Int?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case user_id = "user_id"
        case user_fullname = "user_fullname"
        case user_phone = "user_phone"
        case user_email = "user_email"
        case avatarurl = "avatarurl"
        case isactivated = "isactivated"
        case userrole = "userrole"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        user_fullname = try values.decodeIfPresent(String.self, forKey: .user_fullname)
        user_phone = try values.decodeIfPresent(String.self, forKey: .user_phone)
        user_email = try values.decodeIfPresent(String.self, forKey: .user_email)
        avatarurl = try values.decodeIfPresent(String.self, forKey: .avatarurl)
        isactivated = try values.decodeIfPresent(Bool.self, forKey: .isactivated)
        userrole = try values.decodeIfPresent(Int.self, forKey: .userrole)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}
