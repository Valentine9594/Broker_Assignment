//
//  BrokerViewModel.swift
//  BrokerNetwork
//
//  Created by neosoft on 15/04/22.
//

import Foundation

protocol BrokerViewModelType{
    func getResponse()
    func getBrokerAt(index: Int) -> CardData?
    func getTotalNumberOfBrokers() -> Int
    var tableShouldReload: ReactiveListener<Bool>{get}
}

class BrokerViewModel: BrokerViewModelType{
    var tableShouldReload: ReactiveListener<Bool> = ReactiveListener(false)
    private var brokerCards = [Cards]()
    
    func getResponse() {
        APIService.callAPI { response in
            switch response{
                case .success(let data):
                    let jsonData: APIData? = decodeDataFromJSON(data: data)
                    if let _brokerCards = jsonData?.cards{
                        self.brokerCards = _brokerCards
                    }
                    self.tableShouldReload.value = true
                case .failure(_):
                    self.tableShouldReload.value = false
            }
        }
    }
    
    func getBrokerAt(index: Int) -> CardData? {
        return brokerCards[index].data
    }
    
    func getTotalNumberOfBrokers() -> Int {
        return brokerCards.count
    }
    
    deinit {
        brokerCards.removeAll()
    }
    
}
