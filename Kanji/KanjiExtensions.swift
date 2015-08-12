//
//  KanjiExtensions.swift
//  Kanji
//
//  Created by Olof Olsson on 11/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit
import CoreData

extension Kanji {
    var yomi:String{
        get{
            return kunyomi == "" ? onyomi : onyomi == "" ? kunyomi : "\(kunyomi), \(onyomi)"
        }
    }
    
    static func createKanji(kanji: String, kunyomi: String, onyomi: String, translations: [String], strokes: Int?, jlpt: Int?, grade: Int?, freq: Int?, similarKanji: [String], parts: [String]){
        
        let managedObjectContext =
        (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("Kanji", inManagedObjectContext: managedObjectContext!)
        let kanjiData = Kanji(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        kanjiData.kanji = kanji
        kanjiData.kunyomi = kunyomi
        kanjiData.onyomi = onyomi
        kanjiData.romanji = GanaTranslater.translateYomi(kunyomi == "" ? onyomi : onyomi == "" ? kunyomi : "\(kunyomi), \(onyomi)")
        
        if let strokes = strokes{
            kanjiData.strokecount = strokes
        }
        if let jlpt = jlpt{
            kanjiData.jlpt = jlpt
        }
        if let grade = grade{
            kanjiData.grade = grade
        }
        if let freq = freq{
            kanjiData.freq = freq
        }
        
        kanjiData.translations = translations
        kanjiData.similarKanji = similarKanji
        kanjiData.parts = parts
        let translationString = ",".join(translations)
        kanjiData.searchString = "\(kanji),\(onyomi), \(kunyomi), \(kanjiData.romanji), \(translationString)"
        
        var error:NSError?
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.managedObjectContext?.save(&error)
    }
}
