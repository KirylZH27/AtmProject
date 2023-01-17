//
//  API.swift
//  ATM-BankMap
//
//  Created by Кирилл Жогальский on 12.01.23.
//

import Foundation
import Moya

enum API {
    case getAtm
}

extension API: TargetType{
    
    var baseURL: URL {
        return URL(string: "https://belarusbank.by/api/atm")!
    }
    
    var path: String {
        return ""
    }
    var method: Moya.Method {
        switch self  {
            case .getAtm: return.get
        }
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
            
        return.requestParameters(parameters: parameters, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        var parameters = [String: Any]()
            
        switch self {
            case .getAtm:
                parameters["city"] = "Минск"
        }
        return parameters
    }

    var encoding: ParameterEncoding {
        switch self {
            case.getAtm:
                return URLEncoding.queryString
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
}
