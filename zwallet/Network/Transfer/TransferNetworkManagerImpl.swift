//
//  TransferNetworkManagerImpl.swift
//  zwallet
//
//  Created by user217931 on 4/7/22.
//

import Foundation
import Moya

public class TransferNetworkManagerImpl: TransferNetworkManager{
    
    public init(){
        
    }
    
    public func transfer(receiver: String, amount: Int, notes: String, completion: @escaping (TransferResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferApi>()
        provider.request(.transfer(receiver: receiver, amount: amount, notes: notes)) { result in switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do{
                    let responseTransfer = try decoder.decode(TransferResponse.self, from: res.data)
                    completion(responseTransfer, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let err):
                completion(nil, err)
            }
        }
    }
}
