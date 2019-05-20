//
//  QueueOfWaitFileMessagesModel.swift
//  FanapPodChatSDK
//
//  Created by Mahyar Zhiani on 11/27/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

open class QueueOfWaitFileMessagesModel {
    
    let content:        String?
    let fileName:       String?
    let imageName:      String?
    let metaData:       JSON?
    let repliedTo:      Int?
    let subjectId:      Int?
    let threadId:       Int?
    let typeCode:       String?
    let uniqueId:       String?
    let xC:             String?
    let yC:             String?
    let hC:             String?
    let wC:             String?
    let fileToSend:     Data?
    let imageToSend:    Data?
    
    init(content:           String?,
         fileName:          String?,
         imageName:         String?,
         metaData:          JSON?,
         repliedTo:         Int?,
         subjectId:         Int?,
         threadId:          Int?,
         typeCode:          String?,
         uniqueId:          String?,
         xC:                String?,
         yC:                String?,
         hC:                String?,
         wC:                String?,
         fileToSend:        Data?,
         imageToSend:       Data?) {
        
        self.content        = content
        self.fileName       = fileName
        self.imageName      = imageName
        self.metaData       = metaData
        self.repliedTo      = repliedTo
        self.subjectId      = subjectId
        self.threadId       = threadId
        self.typeCode       = typeCode
        self.uniqueId       = uniqueId
        self.xC             = xC
        self.yC             = yC
        self.hC             = hC
        self.wC             = wC
        self.fileToSend     = fileToSend
        self.imageToSend    = imageToSend
        
    }
    
    init(fileMessageInputModel: SendFileMessageRequestModel, uniqueId: String) {
        self.content        = fileMessageInputModel.content
        self.fileName       = fileMessageInputModel.fileName
        self.imageName      = fileMessageInputModel.imageName
        self.metaData       = fileMessageInputModel.metaData
        self.repliedTo      = fileMessageInputModel.repliedTo
        self.subjectId      = fileMessageInputModel.subjectId
        self.threadId       = fileMessageInputModel.threadId
        self.typeCode       = fileMessageInputModel.typeCode
        self.uniqueId       = uniqueId
        self.xC             = fileMessageInputModel.xC
        self.yC             = fileMessageInputModel.yC
        self.hC             = fileMessageInputModel.hC
        self.wC             = fileMessageInputModel.wC
        self.fileToSend     = fileMessageInputModel.fileToSend
        self.imageToSend    = fileMessageInputModel.imageToSend
    }
    
}
