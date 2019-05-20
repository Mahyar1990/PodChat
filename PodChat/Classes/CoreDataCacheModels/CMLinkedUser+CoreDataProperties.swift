//
//  CMLinkedUser+CoreDataProperties.swift
//  FanapPodChatSDK
//
//  Created by Mahyar Zhiani on 11/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData


extension CMLinkedUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CMLinkedUser> {
        return NSFetchRequest<CMLinkedUser>(entityName: "CMLinkedUser")
    }
    
    @NSManaged public var id:           NSNumber?
    @NSManaged public var image:        String?
    @NSManaged public var name:         String?
    @NSManaged public var nickname:     String?
    @NSManaged public var username:     String?
    @NSManaged public var dummyContact: CMContact?
    
}
