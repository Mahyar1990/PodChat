//
//  CMForwardInfo+CoreDataClass.swift
//  FanapPodChatSDK
//
//  Created by Mahyar Zhiani on 11/1/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData


public class CMForwardInfo: NSManagedObject {
    
    public func convertCMForwardInfoToForwardInfoObject() -> ForwardInfo {
        
        let forwardInfoModel = ForwardInfo(conversation: conversation?.convertCMConversationToConversationObject(),
                                           participant: participant?.convertCMParticipantToParticipantObject())
        
        return forwardInfoModel
    }
    
}
