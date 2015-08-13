//
//  Data.swift
//  Kanji
//
//  Created by Olof Olsson on 08/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit
import CoreData

protocol DataReaderDelegate: class{
    func entryRead(kanji:String)
    func finishedParsing()
}

class DataReader: NSObject, NSXMLParserDelegate{
    
    weak var delegate:DataReaderDelegate?
    
    static var kanjiIsLoaded:Bool{
        get{
            let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
            let entityDescription = NSEntityDescription.entityForName("Kanji", inManagedObjectContext: managedObjectContext!)
            
            let request = NSFetchRequest()
            request.entity = entityDescription
            request.fetchLimit = 1
            
            var error: NSError?
            
            var objects = managedObjectContext?.executeFetchRequest(request,
                error: &error)
            
            return objects?.count >= 1
        }
    }
    
    func loadBaseKanji(){
            let masterDataUrl: NSURL = NSBundle.mainBundle().URLForResource("kanjidic2", withExtension: "blob")!
            var xmlParser = NSXMLParser(contentsOfURL: masterDataUrl)!
            xmlParser.delegate = self
            xmlParser.parse()
    }
    
    var onyomi: String = ""
    var kunyomi: String = ""
    var kanji: String = ""
    var translations: [String] = []
    var grade: Int?
    var strokCount: Int?
    var radName: String?
    var freq: Int?
    var jlpt: Int?
    
    var currentElementName:String = ""
    var foundCharacters = ""
    var currentAttr:[NSObject : AnyObject] = [:]
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject])
    {
        foundCharacters = ""
        
        currentElementName = elementName
        currentAttr = attributeDict
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if elementName == "character"{
            Kanji.createKanji(kanji, kunyomi: kunyomi, onyomi: onyomi, translations: translations, strokes: strokCount, jlpt: jlpt, grade: grade, freq: freq, similarKanji: [], parts: [])
            delegate?.entryRead(kanji)
            kanji = ""
            kunyomi = ""
            onyomi = ""
            strokCount = nil
            freq = nil
            grade = nil
            jlpt = nil
            translations = []
            
        }
        if foundCharacters != ""{
            if currentElementName == "reading" && currentAttr["r_type"] as! String == "ja_on"{
                onyomi = foundCharacters
            }
            else if currentElementName == "reading" && currentAttr["r_type"] as! String == "ja_kun"{
                kunyomi = foundCharacters
            }
            else if currentElementName == "literal"{
                kanji = foundCharacters
            }
            else if currentElementName == "grade"{
                grade = foundCharacters.toInt()
            }
            else if currentElementName == "stroke_count"{
                strokCount = foundCharacters.toInt()
            }
            else if currentElementName == "rad_name"{
                radName = foundCharacters
            }
            else if currentElementName == "freq"{
                freq = foundCharacters.toInt()
            }
            else if currentElementName == "jlpt"{
                jlpt = foundCharacters.toInt()
            }
            else if currentElementName == "meaning"{
                if currentAttr["m_lang"] == nil{
                    translations += [foundCharacters]
                }
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        if let string = string{
            if (currentElementName == "literal") || (currentElementName == "grade") || currentElementName == "stroke_count" || currentElementName == "rad_name" || currentElementName == "freq" || currentElementName == "jlpt" {
                foundCharacters += string
            }
            
            if currentElementName == "reading"{
                if currentAttr["r_type"] as! String == "ja_on"{
                    foundCharacters += string
                }else if currentAttr["r_type"] as! String == "ja_kun"{
                    foundCharacters += string
                }
            }
            
            if currentElementName == "meaning"{
                if currentAttr["m_lang"] == nil{
                    foundCharacters += string
                }
            }
        }
        
    }
    
    func parserDidEndDocument(parser: NSXMLParser){
        delegate?.finishedParsing()
    }
}
