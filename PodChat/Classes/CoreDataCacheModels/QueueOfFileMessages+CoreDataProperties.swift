//
//  QueueOfFileMessages+CoreDataProperties.swift
//  FanapPodChatSDK
//
//  Created by Mahyar Zhiani on 11/27/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//
//

import Foundation
import CoreData


extension QueueOfFileMessages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QueueOfFileMessages> {
        return NSFetchRequest<QueueOfFileMessages>(entityName: "QueueOfFileMessages")
    }

    @NSManaged public var fileName:     String?
    @NSManaged public var imageName:    String?
    @NSManaged public var xC:           String?
    @NSManaged public var yC:           String?
    @NSManaged public var hC:           String?
    @NSManaged public var wC:           String?
    @NSManaged public var threadId:     NSNumber?
    @NSManaged public var content:      String?
    @NSManaged public var metaData:     NSObject?
    @NSManaged public var repliedTo:    NSNumber?
    @NSManaged public var subjectId:    NSNumber?
    @NSManaged public var typeCode:     String?
    @NSManaged public var uniqueId:     String?
    @NSManaged public var fileToSend:   NSData?
    @NSManaged public var imageToSend:  NSData?

}
