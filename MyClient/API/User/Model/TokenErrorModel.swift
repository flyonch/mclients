//
//  tokenErrorModel.swift
//  MyClient
//
//  Created by Leonid Fedorov on 09.05.2023.
//

import Foundation
struct tokenErrorModel : Codable {
    let message : String?
    let errors : [String]?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case errors = "errors"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        errors = try values.decodeIfPresent([String].self, forKey: .errors)
    }

}
