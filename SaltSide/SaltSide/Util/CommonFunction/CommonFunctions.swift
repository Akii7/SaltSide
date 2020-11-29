//
//  CommonFunctions.swift
//  SaltSide
//
//  Created by Akash Sidhwani on 29/11/20.
//

import Foundation

class CommonFunction {
  public static func convertJsonObjectToModel<T: Decodable>(_ object: [String: Any], modelType: T.Type) -> T? {
      do {
          let jsonData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
          
          let reqJSONStr = String(data: jsonData, encoding: .utf8)
          let data = reqJSONStr?.data(using: .utf8)
          let jsonDecoder = JSONDecoder()
          do {
              let modelObj = try jsonDecoder.decode(modelType, from: data!)
              return modelObj
          }
          catch {
              print("error \(error)")
          }
      }
      catch {
          print("error \(error)")
      }
      return nil
  }
}
