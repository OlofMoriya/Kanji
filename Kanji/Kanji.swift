//
//  Kanji.swift
//  Kanji
//
//  Created by Olof Olsson on 11/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import Foundation
import CoreData

class Kanji: NSManagedObject {

    @NSManaged var kanji: String
    @NSManaged var onyomi: String
    @NSManaged var kunyomi: String
    @NSManaged var romanji: String
    @NSManaged var similarKanji: AnyObject
    @NSManaged var translations: AnyObject
    @NSManaged var searchString: String
    @NSManaged var strokecount: NSNumber
    @NSManaged var jlpt: NSNumber
    @NSManaged var freq: NSNumber
    @NSManaged var grade: NSNumber
    @NSManaged var parts: AnyObject

}
