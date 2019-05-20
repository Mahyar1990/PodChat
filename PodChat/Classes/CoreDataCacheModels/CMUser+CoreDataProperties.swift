//
//  CMUser+CoreDataProperties.swift
//  FanapPodChatSDK
//
//  Created by Mahyar Zhiani on 11/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData


extension CMUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CMUser> {
        return NSFetchRequest<CMUser>(entityName: "CMUser")
    }
    
    @NSManaged public var cellphoneNumber:  String?
    @NSManaged public var email:            String?
    @NSManaged public var id:               NSNumber?
    @NSManaged public var image:            String?
    @NSManaged public var lastSeen:         NSNumber?
    @NSManaged public var name:             String?
    @NSManaged public var receiveEnable:    NSNumber?
    @NSManaged public var sendEnable:       NSNumber?
    
}
