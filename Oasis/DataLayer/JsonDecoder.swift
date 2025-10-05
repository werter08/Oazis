//
//  JsonDecoder.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import Foundation

class DataManager {
    
    func getModuls(completion: @escaping (Completion<[ModulModel]>) -> ()) {
        
        let modulData = CustomData.modulString.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ResponceResultModel<ModulModel>.self, from: modulData)

            print(result)
            completion(Completion(content: result.content))
        } catch {
            print(error)
            completion(Completion(content: [], complitionError: .decodeFail))
        }
    }
    
    func getRobots(completion: @escaping (Completion<[RobotModel]>) -> ()) {
        
        let modulData = CustomData.robotString.data(using: .utf8)!
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(ResponceResultModel<RobotModel>.self, from: modulData)

            print(result)
            completion(Completion(content: result.content))
        } catch {
            print(error)
            completion(Completion(content: [], complitionError: .decodeFail))
        }
    }
}

struct Completion<T> {
    var content: T
    var complitionError: Customerrors? = nil
}


enum Customerrors {
    case decodeFail
    case unknown
}

struct ResponceResultModel<T: Decodable>: Decodable {
    let content: [T]
}
