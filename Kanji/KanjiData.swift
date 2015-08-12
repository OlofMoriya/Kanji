//
//  KanjiData.swift
//  Kanji
//
//  Created by Olof Olsson on 08/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit

class KanjiData: NSObject {
    var kanji: String!
    var kunyomi: String!
    var onyomi: String!
    var romanji:String!
    var strokes: Int?
    var yomi: String{
        get{
            return kunyomi == "" ? onyomi : onyomi == "" ? kunyomi : "\(kunyomi), \(onyomi)"
        }
    }
    
    var translations:[String] = []
    var similarKanji: [String]? = []
    var parts: [String]? = []
    
    init(kanji: String, kunyomi: String, onyomi: String, translations: [String], similarKanji: [String]?, parts: [String]?){
        self.kanji = kanji
        self.kunyomi = kunyomi
        self.onyomi = onyomi
        self.romanji = GanaTranslater.translateYomi(kunyomi == "" ? onyomi : onyomi == "" ? kunyomi : "\(kunyomi), \(onyomi)")
        self.translations = translations
        self.similarKanji = similarKanji
        self.parts = parts
    }
    
    init(kanji: String, kunyomi: String, onyomi: String, translations: [String], similarKanji: [String]?, parts: [String]?, strokes: Int?){
        self.kanji = kanji
        self.kunyomi = kunyomi
        self.onyomi = onyomi
        self.strokes = strokes
        self.romanji = GanaTranslater.translateYomi(kunyomi == "" ? onyomi : onyomi == "" ? kunyomi : "\(kunyomi), \(onyomi)")
        self.translations = translations
        self.similarKanji = similarKanji
        self.parts = parts
    }
    
    
    static func createKanjiData(dictionary: NSDictionary)->KanjiData?{
        if let kanji = dictionary["kanji"] as? String, kunyomi = dictionary["kunyomi"] as? String, onyomi = dictionary["onyomi"] as? String, translations = dictionary["translations"] as? [String]{
            let parts = dictionary["parts"] as? [String]
            let similarKanji = dictionary["similarKanji"] as? [String]
            let strokes = dictionary["strokes"] as? Int
            
            return KanjiData(kanji: kanji, kunyomi: kunyomi, onyomi: onyomi, translations: translations, similarKanji: similarKanji, parts: parts, strokes: strokes)
        }
        else{
            return nil
        }
    }
    
}
