//
//  Function Constants.swift
//  BrokerNetwork
//
//  Created by neosoft on 18/04/22.
//

import Foundation

func decodeDataFromJSON<T: Decodable>(data: Data) -> T?{
    let jsonDecoder = JSONDecoder()
    let jsonData = try? jsonDecoder.decode(T.self, from: data)
    return jsonData
}

func addAllTextWithSpacedBlackDots<T>(stringArray: [T]) -> String{
    var text = ""
    
    if let stringArr = stringArray as? [SubInfoInMainPost]{
        for i in 0..<stringArr.count{
            text += (stringArr[i].text ?? "")
            if i < stringArr.count - 1{
                text += "•"
            }
        }
    }
    else if let stringArr = stringArray as? [SubInfoInHorizontalCards]{
        for i in 0..<stringArr.count{
            text += (stringArr[i].text ?? "")
            if i < stringArr.count - 1{
                text += "•"
            }
        }
    }
    return text
}
