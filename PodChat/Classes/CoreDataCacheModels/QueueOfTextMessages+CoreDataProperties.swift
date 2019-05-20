//
//  QueueOfTextMessages+CoreDataProperties.swift
//  FanapPodChatSDK
//
//  Created by Mahyar Zhiani on 11/27/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData


extension QueueOfTextMessages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QueueOfTextMessages> {
        return NSFetchRequest<QueueOfTextMessages>(entityName: "QueueOfTextMessages")
    }

    @NSManaged public var content:          String?
    @NSManaged public var repliedTo:        NSNumber?
    @NSManaged public var threadId:         NSNumber?
    @NSManaged public var typeCode:         String?
    @NSManaged public var uniqueId:         String?
    @NSManaged public var metaData:         NSObject?
    @NSManaged public var systemMetadata:   NSObject?

}
