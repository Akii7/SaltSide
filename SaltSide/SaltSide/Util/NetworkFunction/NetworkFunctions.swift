/**
 This class contains Network calls response parsing functions
 */
import Foundation
import Alamofire
import UIKit
import CoreData

// Global TypeAlias
typealias ApiParsedResponse = (ApiResponseModel.SuccessModel?, ApiResponseModel.FailureModel?) ->()


class NetworkFunctions {
  /**
   Parse response
   */
  static let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.apple.com")
  
  static func parseApiResponse(_ response: DataResponse<Any>, parsedResponse: @escaping(ApiParsedResponse))  {
    let responseCode = response.response?.statusCode
    if let responseDict = response.result.value as? [Any] {
      print(response.response?.statusCode as Any)
      let codeArr = [200, 202, 203, 204]
      let val = codeArr.filter({$0 == responseCode})
      if val.count > 0 {
        let successResponse = parseApiSuccessResponse(responseDict)
        parsedResponse(successResponse, nil)
      } else {
        let failureResponse = parseApiFailureResponse(responseDict)
        parsedResponse(nil,failureResponse)
      }
    } else {
      if let error = response.error as NSError? {
        if error.code == -1004 {
        } else {
          let failureResponse = ApiResponseModel.FailureModel(type: "", details: nil, description: error.localizedDescription)
          parsedResponse(nil,failureResponse)
        }
      } else {
        let failureResponse = ApiResponseModel.FailureModel(type: "", details: nil, description: "Something went wrong")
        parsedResponse(nil,failureResponse)
      }
    }
  }
  /**
   Handel API success response
   */
  static func parseApiSuccessResponse(_ response: [Any]) -> ApiResponseModel.SuccessModel {
    let apiResponseObj = ApiResponseModel.SuccessModel(
      response: response,
      description: "",
      code: InternalCode.success
    )
    return apiResponseObj
  }
  /**
   Handel API failure response
   */
  static func parseApiFailureResponse(_ response: [Any]) -> ApiResponseModel.FailureModel {
    return ApiResponseModel.FailureModel(type: "", details: nil, description: "Something went wrong")
  }
}
