//
//  ImagesVM.swift
//  SaltSide
//
//  Created by Akash Sidhwani on 29/11/20.
//

import UIKit

typealias Result = (_ success: Bool, _ msg:String) -> Void
let url = "https://gist.githubusercontent.com/ashwini9241/6e0f26312ddc1e502e9d280806eed8bc/raw/7fab0cf3177f17ec4acd6a2092fc7c0f6bba9e1f/saltside-json-data"

protocol ImagesVMProtocal {
  func getImages(handler: @escaping Result)
}

class ImagesVM {
  var imagesDataList = [Images]()
}

extension ImagesVM: ImagesVMProtocal {
  func getImages(handler: @escaping Result) {
    
    NetworkingWrapper.sharedInstance.connect(url: url, httpMethod: .get, headers: nil, parameters: nil, showHudder: true) { (httpUrlResponse) in
      NetworkFunctions.parseApiResponse(httpUrlResponse, parsedResponse: { (successResponse, failureResponse) in
        if let success = successResponse {
          guard let response = success.response as? [Any] else {
            handler(false, success.description)
            return
          }
          for info in response {
            if let infoDic = info as? [String: AnyObject] {
              guard let imageData = CommonFunction.convertJsonObjectToModel(infoDic, modelType: Images.self) else {
                handler(false, success.description)
                return
              }
              self.imagesDataList.append(imageData)
            }
          }
          handler(true,success.description)
        } else {
          handler(false,failureResponse?.description ?? "")
        }
      })
    }
  }
}
