/**
 This is the common api response model
 */

import Foundation

enum HttpCode: NSNumber{
    
    case success = 200
    case failure = 400
}

enum InternalCode: Int{
    
    case success = 1
    case failure = 0
}

struct ApiResponseModel {
    
    struct SuccessModel {
        let response: Any?
        let description: String
        let code: InternalCode
    }
    
    struct DetailKeys {
        let field: String
        let message: String
    }
    
    struct FailureModel {
        let type: String
        let details: [DetailKeys]?
        let description: String
    }
}
