//
//  UploadImageModel.swift
//  Chat
//
//  Created by Mahyar Zhiani on 8/5/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

open class UploadImageModel {
    /*
     ---------------------------------------
     * responseAsJSON:
     *  - hasError          Bool
     *  - errorMessage      String
     *  - errorCode         Int
     *  + result       JSON or UploadImageModel:
     *      + UploadImage   UploadImageAsJSON:
     *          - actualHeight  Int?
     *          - actualWidth   Int?
     *          - hashCode      String?
     *          - height        Int?
     *          - id            Int?
     *          - name          String?
     *          - width         Int?
     ---------------------------------------
     * responseAsModel:
     *  - hasError          Bool
     *  - errorMessage      String
     *  - errorCode         Int
     *  + user              User
     ---------------------------------------
     */
    
    // uploadImage model properties
    public let errorCode:           Int
    public let errorMessage:        String
    public let hasError:            Bool
    //    public var localPath:           String = ""
    public let uploadImage:         UploadImage?
    
    
    public var uploadImageJSON: JSON = [:]
    
    public init(messageContentJSON: JSON?,
                errorCode:      Int,
                errorMessage:   String,
                hasError:       Bool/*,
         localPath:      String?*/) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        //        if let pathString = localPath {
        //            self.localPath = pathString
        //        }
        
        if let content = messageContentJSON {
            self.uploadImage = UploadImage(messageContent: content)
            self.uploadImageJSON = uploadImage!.formatToJSON()
        } else {
            uploadImage = nil
        }
        
    }
    
    public init(messageContentModel: UploadImage?,
                errorCode:      Int,
                errorMessage:   String,
                hasError:       Bool/*,
         localPath:      String?*/) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        //        if let pathString = localPath {
        //            self.localPath = pathString
        //        }
        
        if let myImage = messageContentModel {
            self.uploadImage    = myImage
            self.uploadImageJSON = uploadImage!.formatToJSON()
        } else {
            uploadImage = nil
        }
    }
    
    
    public func returnDataAsJSON() -> JSON {
        let result: JSON = ["uploadImage": uploadImageJSON]
        
        let resultAsJSON: JSON = ["result": result,
                                  "errorCode": errorCode,
                                  "errorMessage": errorMessage,
                                  "hasError": hasError/*,
             "localPath": localPath*/]
        
        return resultAsJSON
    }
    
}

