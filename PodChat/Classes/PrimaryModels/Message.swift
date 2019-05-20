//
//  Message.swift
//  Chat
//
//  Created by Mahyar Zhiani on 7/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON


//#######################################################################################
//#############################      Message        (formatDataToMakeMessage)
//#######################################################################################

open class Message {
    /*
     * + MessageVO      Message:
     *    - delivered:      Bool?
     *    - editable:       Bool?
     *    - edited:         Bool?
     *    - id:             Int?
     *    - message:        String?
     *    - metaData:       String?
     *    - ownerId:        Int?
     *    - previousId:     Int?
     *    - seen:           Bool?
     *    - threadId:       Int?
     *    - time:           Int?
     *    - uniqueId:       String?
     *    - conversation:   Conversation?
     *    - forwardInfo:    ForwardInfo?
     *    - participant:    Participant?
     *    - replyInfo:      ReplyInfo?
     */
    
    public let delivered:   Bool?
    public let editable:    Bool?
    public let edited:      Bool?
    public let deletable:  Bool?
    public var id:          Int?
    public var message:     String?
    public let messageType: String?
    public var metaData:    String?
    public var ownerId:     Int?
    public let previousId:  Int?
    public let seen:        Bool?
    public var threadId:    Int?
    public let time:        UInt?
    public let uniqueId:    String?
    
    public var conversation:   Conversation?
    public var forwardInfo:    ForwardInfo?
    public var participant:    Participant?
    public var replyInfo:      ReplyInfo?
    
    public init(threadId: Int?, pushMessageVO: JSON) {
        
        self.threadId   = threadId
        self.delivered  = pushMessageVO["delivered"].bool
        self.editable   = pushMessageVO["editable"].bool
        self.edited     = pushMessageVO["edited"].bool
        self.deletable  = pushMessageVO["deletable"].bool
        self.id         = pushMessageVO["id"].int
        self.message    = pushMessageVO["message"].string
        self.messageType = pushMessageVO["messageType"].string
        self.metaData   = pushMessageVO["metaData"].string
        self.previousId = pushMessageVO["previousId"].int
        self.seen       = pushMessageVO["seen"].bool
        //        self.time       = pushMessageVO["time"].int
        self.uniqueId   = pushMessageVO["uniqueId"].string
        
        let timeNano = pushMessageVO["timeNanos"].uIntValue
        let timeTemp = pushMessageVO["time"].uIntValue
        self.time = ((UInt(timeTemp / 1000)) * 1000000000 ) + timeNano
        
        if (pushMessageVO["conversation"] != JSON.null) {
            self.conversation = Conversation(messageContent: pushMessageVO["conversation"])
        }
        
        if (pushMessageVO["forwardInfo"] != JSON.null) {
            self.forwardInfo = ForwardInfo(messageContent: pushMessageVO["forwardInfo"])
        }
        
        if (pushMessageVO["participant"] != JSON.null) {
            let tempParticipant = Participant(messageContent: pushMessageVO["participant"], threadId: threadId)
            self.participant = tempParticipant
            let tempOwnerId = tempParticipant.formatToJSON()["id"].int
            self.ownerId = tempOwnerId
        }
        
        if (pushMessageVO["replyInfoVO"] != JSON.null) {
            self.replyInfo = ReplyInfo(messageContent: pushMessageVO["replyInfoVO"])
        }
        
        
        //        if let myParticipant = pushMessageVO["participant"].array {
        //            let tempParticipant = Participant(messageContent: myParticipant.first!)
        //            self.participant = tempParticipant
        //            let tempOwnerId = myParticipant.first!["id"].int
        //            self.ownerId = tempOwnerId
        //        }
        //        if let myConversation = pushMessageVO["conversation"].array {
        //            self.conversation = Conversation(messageContent: myConversation.first!)
        //        }
        //        if let myReplyInfo = pushMessageVO["replyInfoVO"].array {
        //            self.replyInfo = ReplyInfo(messageContent: myReplyInfo.first!)
        //        }
        //        if let myForwardInfo = pushMessageVO["forwardInfo"].array {
        //            self.forwardInfo = ForwardInfo(messageContent: myForwardInfo.first!)
        //        }
        
    }
    
    public init(threadId:      Int?,
                delivered:     Bool?,
                editable:      Bool?,
                edited:        Bool?,
                deletable:     Bool?,
                id:            Int?,
                message:       String?,
                messageType:   String?,
                metaData:      String?,
                ownerId:       Int?,
                previousId:    Int?,
                seen:          Bool?,
                time:          UInt?,
                uniqueId:      String?,
                conversation:  Conversation?,
                forwardInfo:   ForwardInfo?,
                participant:   Participant?,
                replyInfo:     ReplyInfo?) {
        
        self.threadId   = threadId
        self.delivered  = delivered
        self.editable   = editable
        self.edited     = edited
        self.deletable = deletable
        self.id         = id
        self.message    = message
        self.messageType = messageType
        self.metaData   = metaData
        self.ownerId    = participant?.id
        self.previousId = previousId
        self.seen       = seen
        self.time       = time
        self.uniqueId   = uniqueId
        self.conversation   = conversation
        self.forwardInfo    = forwardInfo
        self.participant    = participant
        self.replyInfo      = replyInfo
    }
    
    
    public init(theMessage: Message) {
        
        self.threadId   = theMessage.threadId
        self.delivered  = theMessage.delivered
        self.editable   = theMessage.editable
        self.edited     = theMessage.edited
        self.deletable  = theMessage.deletable
        self.id         = theMessage.id
        self.message    = theMessage.message
        self.messageType = theMessage.messageType
        self.metaData   = theMessage.metaData
        self.ownerId    = theMessage.participant?.id
        self.previousId = theMessage.previousId
        self.seen       = theMessage.seen
        self.time       = theMessage.time
        self.uniqueId   = theMessage.uniqueId
        self.conversation   = theMessage.conversation
        self.forwardInfo    = theMessage.forwardInfo
        self.participant    = theMessage.participant
        self.replyInfo      = theMessage.replyInfo
    }
    
    
    func formatDataToMakeMessage() -> Message {
        return self
    }
    
    func formatToJSON() -> JSON {
        let result: JSON = ["delivered":        delivered ?? NSNull(),
                            "editable":         editable ?? NSNull(),
                            "edited":           edited ?? NSNull(),
                            "deletable":        deletable ?? NSNull(),
                            "id":               id ?? NSNull(),
                            "message":          message ?? NSNull(),
                            "messageType":      messageType ?? NSNull(),
                            "metaData":         metaData ?? NSNull(),
                            "ownerId":          ownerId ?? NSNull(),
                            "previousId":       previousId ?? NSNull(),
                            "seen":             seen ?? NSNull(),
                            "threadId":         threadId ?? NSNull(),
                            "time":             time ?? NSNull(),
                            "uniqueId":         uniqueId ?? NSNull(),
                            "conversation":     conversation?.formatToJSON() ?? NSNull(),
                            "forwardInfo":      forwardInfo?.formatToJSON() ?? NSNull(),
                            "participant":      participant?.formatToJSON() ?? NSNull(),
                            "replyInfo":        replyInfo?.formatToJSON() ?? NSNull()]
        //        if let conversationJSON = conversation {
        //            result["conversation"] = conversationJSON.formatToJSON()
        //        }
        
        return result
    }
    
}
