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
}
