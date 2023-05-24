//
//  ServiceModel.swift
//  MyClient
//
//  Created by Leonid Fedorov on 16.05.2023.
//

import Foundation

struct ServiceModel : Codable {
    let type_services_id : Int?
    let type_service_name : String?
    let url_image : String?
    
    enum CodingKeys: String, CodingKey {
        
        case type_services_id = "type_services_id"
        case type_service_name = "type_service_name"
        case url_image = "url_image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type_services_id = try values.decodeIfPresent(Int.self, forKey: .type_services_id)
        type_service_name = try values.decodeIfPresent(String.self, forKey: .type_service_name)
        url_image = try values.decodeIfPresent(String.self, forKey: .url_image)
    }
}

struct PodServiceModel : Codable {
    let service_id : Int?
    let type_services_id : Int?
    let name_service : String?
    let description : String?
    let price : String?
    let duration : Duration?

    enum CodingKeys: String, CodingKey {

        case service_id = "service_id"
        case type_services_id = "type_services_id"
        case name_service = "name_service"
        case description = "description"
        case price = "price"
        case duration = "duration"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        service_id = try values.decodeIfPresent(Int.self, forKey: .service_id)
        type_services_id = try values.decodeIfPresent(Int.self, forKey: .type_services_id)
        name_service = try values.decodeIfPresent(String.self, forKey: .name_service)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        duration = try values.decodeIfPresent(Duration.self, forKey: .duration)
    }

}

struct Duration : Codable {
    let hours : Int?

    enum CodingKeys: String, CodingKey {

        case hours = "hours"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        hours = try values.decodeIfPresent(Int.self, forKey: .hours)
    }

}


struct serviceManager : Codable {
    let user_id : Int?
    let user_fullname : String?

    enum CodingKeys: String, CodingKey {

        case user_id = "user_id"
        case user_fullname = "user_fullname"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        user_fullname = try values.decodeIfPresent(String.self, forKey: .user_fullname)
    }

}


struct freeTimeManagerModel : Codable {
    let user_fullname : String?
    let work_date : String?
    let work_hours_start : String?
    let work_hours_end : String?

    enum CodingKeys: String, CodingKey {

        case user_fullname = "user_fullname"
        case work_date = "work_date"
        case work_hours_start = "work_hours_start"
        case work_hours_end = "work_hours_end"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_fullname = try values.decodeIfPresent(String.self, forKey: .user_fullname)
        work_date = try values.decodeIfPresent(String.self, forKey: .work_date)
        work_hours_start = try values.decodeIfPresent(String.self, forKey: .work_hours_start)
        work_hours_end = try values.decodeIfPresent(String.self, forKey: .work_hours_end)
    }

}


struct appointComplitedModel : Codable {
    let message : String?

    enum CodingKeys: String, CodingKey {

        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct showAppointModel : Codable {
    let user_name : String?
    let manager_name : String?
    let name_service : String?
    let price : String?
    let duration : Duration?
    let date_time_service : String?
    let time_servce : String?
    let appointment_id : Int?

    enum CodingKeys: String, CodingKey {

        case user_name = "user_name"
        case manager_name = "manager_name"
        case name_service = "name_service"
        case price = "price"
        case duration = "duration"
        case date_time_service = "date_time_service"
        case time_servce = "time_servce"
        case appointment_id = "appointment_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
        manager_name = try values.decodeIfPresent(String.self, forKey: .manager_name)
        name_service = try values.decodeIfPresent(String.self, forKey: .name_service)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        duration = try values.decodeIfPresent(Duration.self, forKey: .duration)
        date_time_service = try values.decodeIfPresent(String.self, forKey: .date_time_service)
        time_servce = try values.decodeIfPresent(String.self, forKey: .time_servce)
        appointment_id = try values.decodeIfPresent(Int.self, forKey: .appointment_id)
    }

}

struct statusAppoint : Codable {
    let cancelStatusAppoint : String?

    enum CodingKeys: String, CodingKey {

        case cancelStatusAppoint = "CancelStatusAppoint"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cancelStatusAppoint = try values.decodeIfPresent(String.self, forKey: .cancelStatusAppoint)
    }

}
