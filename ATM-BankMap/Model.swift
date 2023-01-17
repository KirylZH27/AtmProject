//
//  Model.swift
//  ATM-BankMap
//
//  Created by Кирилл Жогальский on 12.01.23.
//

import Foundation

struct Model: Decodable {
   
    var address: String
    var work_time: String
    var gps_x: String
    var gps_y: String
    var cash_in: String

    enum CodingKeys: String, CodingKey {
        case address = "address"
        case work_time = "work_time"
        case gps_x = "gps_x"
        case gps_y = "gps_y"
        case cash_in = "cash_in"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
       
        address = try container.decode(String.self, forKey: .address)
        work_time = try container.decode(String.self, forKey: .work_time)
        gps_x = try container.decode(String.self, forKey: .gps_x)
        gps_y = try container.decode(String.self, forKey: .gps_y)
        cash_in = try container.decode(String.self, forKey: .cash_in)
    }
}
