//
//  Constants.swift
//  BrokerNetwork
//
//  Created by neosoft on 15/04/22.
//

import Foundation

enum APIResponse<T>{
    case success(value: T)
    case failure(error: Error)
}

enum CustomErrors: Error{
    case SomethingWentWrong
    case ErrorCode(code: Int)
    case DataInResponseIsNil
    
    var description: String{
        switch self {
            case .SomethingWentWrong:
                return "Something went wrong!"
            case .ErrorCode(let code):
                return "Error Code: \(code)"
            case .DataInResponseIsNil:
                return "Data in Response is Nil"
        }
    }
}

enum ClientType{
    case Rental
    case Resale
    
    var description: String{
        switch self {
            case .Rental:
                return "rental client"
            case .Resale:
                return "resale client"
        }
    }
}
