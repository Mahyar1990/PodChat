//
//  CreateThreadModel.swift
//  Chat
//
//  Created by Mahyar Zhiani on 7/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


open class CreateThreadModel {
    /*
     ---------------------------------------
     * responseAsJSON:
     *  - hasError      Bool
     *  - errorMessage  String
     *  - errorCode     Int
     *  + result            JSON:
     *      - contentCount      Int
     *      - hasNext           Bool
     *      - nextOffset        Int
     *      + thread            ThreadAsJSON
     *          - admin:                          Bool?
     *          - canEditInfo:                    Bool?
     *          - canSpam:                        Bool?
     *          - description:                    String?
     *          - group:                          Bool?
     *          - id:                             Int?
     *          - image:                          String?
     *          - joinDate:                       Int?
     *          - lastMessage:                    String?
     *          - lastParticipantImage:           String?
     *          - lastParticipantName:            String?
     *          - lastSeenMessageId:              Int?
     *          - metadata:                       String?
     *          - mute:                           Bool?
     *          - participantCount:               Int?
     *          - partner:                        Int?
     *          - partnerLastDeliveredMessageId:  Int?
     *          - partnerLastSeenMessageId:       Int?
     *          - title:                          String?
     *          - time:                           Int?
     *          - type:                           Int?
     *          - unreadCount:                    Int?
     
     *          + inviter:                        Participant?
     *          + lastMessageVO:                  Message?
     *          + participants:                   [Participant]?
     ---------------------------------------
     * responseAsModel:
     *  - hasError      Bool
     *  - errorMessage  String
     *  - errorCode     Int
     *  + thread        Conversation
     ---------------------------------------
     */
    
    // CreateThreads model properties
    public let hasError:           Bool
    public let errorMessage:       String
    public let errorCode:          Int
    
    // result model
    public var contentCount:       Int = 0
    public var hasNext:            Bool = false
    public var nextOffset:         Int = 0
    public var thread:             Conversation?
    
    public var threadJSON:         JSON?
    
    public init(messageContent: JSON,
                hasError:       Bool,
                errorMessage:   String,
                errorCode:      Int) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        //        let messageLength = messageContent.count
        //        self.contentCount = contentCount
        //        self.hasNext = false
        //        let x: Int = count + offset
        //        if (x < contentCount) && (messageLength > 0) {
        //            self.hasNext = true
        //        }
        //        self.nextOffset = offset + messageLength
        
        self.thread = Conversation(messageContent: messageContent)
        self.threadJSON = thread?.formatToJSON()
    }
    
    public init(conversation:   Conversation?,
                hasError:       Bool,
                errorMessage:   String,
                errorCode:      Int) {
        
        self.hasError           = hasError
        self.errorMessage       = errorMessage
        self.errorCode          = errorCode
        
        self.threadJSON = conversation?.formatToJSON()
    }
    
    
    public func returnDataAsJSON() -> JSON {
        let result: JSON = ["contentCount": contentCount,
                            "hasNext":      hasNext,
                            "nextOffset":   nextOffset,
                            "thread":       threadJSON ?? NSNull()]
        
        let finalResult: JSON = ["result": result,
                                 "hasError": hasError,
                                 "errorMessage": errorMessage,
                                 "errorCode": errorCode]
        
        return finalResult
    }
    
    
}
