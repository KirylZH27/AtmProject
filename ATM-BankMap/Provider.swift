//
//  Provider.swift
//  ATM-BankMap
//
//  Created by Кирилл Жогальский on 12.01.23.
//

import Foundation
import Moya

typealias ArrayResponce<T: Decodable> = (([T]) -> Void)
typealias ObjectResponce<T: Decodable> = (([T]) -> Void)
typealias Error = ((String) -> Void)

final class Provider {
    private let provider  = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
                    
    func getATM(success: @escaping ArrayResponce<Model>, failure: @escaping Error) {
        provider.request(.getAtm) { result in
            switch result {
                case .success(let responce):
                    guard let atm = try? JSONDecoder().decode([Model].self, from: responce.data) else { return }
                    success(atm)
                case .failure(let error):
                    failure(error.localizedDescription)
            }
        }
    }
}
