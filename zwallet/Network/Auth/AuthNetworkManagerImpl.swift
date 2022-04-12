//
//  AuthNetworkManagerImpl.swift
//  zwallet
//
//  Created by user217931 on 4/1/22.
//

import Foundation
import Moya

public class AuthNetworkManagerImpl: AuthNetworkManager{
    public init(){
        
    }
    
    public func login(email: String, password: String, completion: @escaping (LoginDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.login(email: email, password: password)) { result in switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    
                    let responseLogin = try decoder.decode(LoginResponse.self, from: res.data)
                    completion(responseLogin.data, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let err):
                completion(nil, err)
            }
        }
    }
    
    public func register(username: String, email: String, password: String, completion: @escaping (RegisterResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.register(username: username, email: email, password: password)) { result in switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let responseRegister = try decoder.decode(RegisterResponse.self, from: res.data)
                    completion(responseRegister, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let err):
                completion(nil, err)
            }
        }
    }
    
    
    public func confirmOtp(email: String, otp: String, completion: @escaping (ConfirmOtpResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.confirmOTP(email: email, otp: otp)) { result in switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let confirmOtpRegister = try decoder.decode(ConfirmOtpResponse.self, from: res.data)
                    completion(confirmOtpRegister, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let err):
                completion(nil, err)
            }
        }
    }
}
