//
//  GanaTranslater.swift
//  Kanji
//
//  Created by Olof Olsson on 08/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit

class GanaTranslater {
    static var characterSet:[(String, String)] = [("ん", "n"),("つ", "tsu"),("きゃ", "kya"),( "きゅ", "kyu"),( "きょ", "kyo"),( "にゃ", "nya"),( "にゅ", "nyu"),( "にょ", "nyo"),( "しゃ", "sha"),( "し", "shi"),( "しゅ", "shu"),( "しょ", "sho"),( "ち", "chi"),( "ちゃ", "cha"),( "ちゅ", "chu"),( "ちょ", "cho"),( "ひゃ", "hya"),( "ひゅ", "hyu"),( "ひょ", "hyo"),( "みゃ", "mya"),( "みゅ", "myu"),( "みょ", "myo"),( "りゃ", "rya"),( "りゅ", "ryu"),( "りょ", "ryo"),( "ぎゃ", "gya"),( "ぎゅ", "gyu"),( "ぎょ", "gyo"),( "びゃ", "bya"),( "びゅ", "byu"),( "びょ", "byo"),( "ぴゃ", "pya"),( "ぴゅ", "pyu"),( "ぴょ", "pyo"),( "じゃ", "ja"),( "じゅ", "ju"),( "じょ", "jo"),( "ば", "ba"),( "だ", "da"),( "が", "ga"),( "は", "ha"),( "か", "ka"),( "ま", "ma"),( "な", "na"),( "ぱ", "pa"),( "ら", "ra"),( "さ", "sa"),( "た", "ta"),( "わ", "wa"),( "や", "ya"),( "ざ", "za"),( "あ", "a"),( "べ", "be"),( "で", "de"),( "げ", "ge"),( "へ", "he"),( "け", "ke"),( "め", "me"),( "ね", "ne"),( "ぺ", "pe"),( "れ", "re"),( "せ", "se"),( "て", "te"),( "ゑ", "we"),( "ぜ", "ze"),( "え", "e"),( "び", "bi"),( "ぎ", "gi"),( "ひ", "hi"),( "き", "ki"),( "み", "mi"),( "に", "ni"),( "ぴ", "pi"),( "り", "ri"),( "ゐ", "wi"),( "じ", "ji"),( "い", "i"),( "ぼ", "bo"),( "ど", "do"),( "ご", "go"),( "ほ", "ho"),( "こ", "ko"),( "も", "mo"),( "の", "no"),( "ぽ", "po"),( "ろ", "ro"),( "そ", "so"),( "と", "to"),( "を", "wo"),( "よ", "yo"),( "ぞ", "zo"),( "お", "o"),( "ぶ", "bu"),( "ぐ", "gu"),( "ふ", "fu"),( "く", "ku"),( "む", "mu"),( "ぬ", "nu"),( "ぷ", "pu"),( "る", "ru"),( "す", "su"),( "ゆ", "yu"),( "ず", "zu"),( "う", "u"),( "ゔ", "v"),( "ぢ", "ji"),( "づ", "zu"),( "ン", "n"),( "シ", "shi"),( "チ", "chi"),( "ツ", "tsu"),( "キャ", "kya"),( "キュ", "kyu"),( "キョ", "kyo"),( "ニャ", "nya"),( "ニュ", "nyu"),( "ニョ", "nyo"),( "シャ", "sha"),( "シュ", "shu"),( "ショ", "sho"),( "チャ", "cha"),( "チュ", "chu"),( "チョ", "cho"),( "ヒャ", "hya"),( "ヒュ", "hyu"),( "ヒョ", "hyo"),( "ミャ", "mya"),( "ミュ", "myu"),( "ミョ", "myo"),( "リャ", "rya"),( "リュ", "ryu"),( "リョ", "ryo"),( "ギャ", "gya"),( "ギュ", "gyu"),( "ギョ", "gyo"),( "ビャ", "bya"),( "ビュ", "byu"),( "ビョ", "byo"),( "ピャ", "pya"),( "ピュ", "pyu"),( "ピョ", "pyo"),( "ジャ", "ja"),( "ジュ", "ju"),( "ジョ", "jo"),( "バ", "ba"),( "ダ", "da"),( "ガ", "ga"),( "ハ", "ha"),( "カ", "ka"),( "マ", "ma"),( "ナ", "na"),( "パ", "pa"),( "ラ", "ra"),( "サ", "sa"),( "タ", "ta"),( "ワ", "wa"),( "ヤ", "ya"),( "ザ", "za"),( "ア", "a"),( "ベ", "be"),( "デ", "de"),( "ゲ", "ge"),( "ヘ", "he"),( "ケ", "ke"),( "メ", "me"),( "ネ", "ne"),( "ペ", "pe"),( "レ", "re"),( "セ", "se"),( "テ", "te"),( "ヱ", "we"),( "ゼ", "ze"),( "エ", "e"),( "ビ", "bi"),( "ギ", "gi"),( "ヒ", "hi"),( "キ", "ki"),( "ミ", "mi"),( "ニ", "ni"),( "ピ", "pi"),( "リ", "ri"),( "ヰ", "wi"),( "ジ", "ji"),( "イ", "i"),( "ボ", "bo"),( "ド", "do"),( "ゴ", "go"),( "ホ", "ho"),( "コ", "ko"),( "モ", "mo"),( "ノ", "no"),( "ポ", "po"),( "ロ", "ro"),( "ソ", "so"),( "ト", "to"),( "ヲ", "wo"),( "ヨ", "yo"),( "ゾ", "zo"),( "オ", "o"),( "ブ", "bu"),( "グ", "gu"),( "フ", "fu"),( "ク", "ku"),( "ム", "mu"),( "ヌ", "nu"),( "プ", "pu"),( "ル", "ru"),( "ス", "su"),( "ユ", "yu"),( "ズ", "zu"),( "ウ", "u")]
    
    static var reverseCharacterSet:[(String, String)] = [("n", "ん"),(  "tsu", "つ"),(  "kya", "きゃ"),( "kyu", "きゅ"),( "kyo", "きょ"),( "nya", "にゃ"),(  "nyu", "にゅ"),(  "nyo", "にょ"),(  "sha", "しゃ"),( "shi", "し"),(  "shu", "しゅ"),(  "sho", "しょ"),( "chi", "ち"),(  "cha", "ちゃ"),(  "chu", "ちゅ"),(  "cho", "ちょ"),(  "hya", "ひゃ"),( "hyu", "ひゅ"),( "hyo", "ひょ"),( "mya", "みゃ"),( "myu", "みゅ"),( "myo", "みょ"),( "rya", "りゃ"),( "ryu", "りゅ"),( "ryo", "りょ"),( "gya", "ぎゃ"),( "gyu", "ぎゅ"),( "gyo", "ぎょ"),( "bya", "びゃ"),( "byu", "びゅ"),( "byo", "びょ"),( "pya", "ぴゃ"),( "pyu", "ぴゅ"),( "pyo", "ぴょ"),( "ja", "じゃ"),( "ju", "じゅ"),( "jo", "じょ"),( "ba", "ば"),(  "da", "だ"),(  "ga", "が"),(  "ha", "は"),(  "ka", "か"),(  "ma", "ま"),(  "na", "な"),(  "pa", "ぱ"),(  "ra", "ら"),(  "sa", "さ"),(  "ta", "た"),(  "wa", "わ"),(  "ya", "や"),(  "za", "ざ"),( "a", "あ"),(  "be", "べ"),(  "de", "で"),(  "ge", "げ"),(  "he", "へ"),(  "ke", "け"),(  "me", "め"),(  "ne", "ね"),(  "pe", "ぺ"),(  "re", "れ"),(  "se", "せ"),(  "te", "て"),(  "we", "ゑ"),( "ze", "ぜ"),(  "e", "え"),( "bi", "び"),(  "gi", "ぎ"),(  "hi", "ひ"),(  "ki", "き"),(  "mi", "み"),(  "ni", "に"),(  "pi", "ぴ"),(  "ri", "り"),(  "wi", "ゐ"),( "ji", "じ"),(  "i", "い"),( "bo", "ぼ"),(  "do", "ど"),(  "go", "ご"),(  "ho", "ほ"),(  "ko", "こ"),(  "mo", "も"),(  "no", "の"),(  "po", "ぽ"),(  "ro", "ろ"),(  "so", "そ"),(  "to", "と"),(  "wo", "を"),(  "yo", "よ"),(  "zo", "ぞ"),(  "o", "お"),(  "bu", "ぶ"),(  "gu", "ぐ"),(  "fu", "ふ"),(  "ku", "く"),(  "mu", "む"),(  "nu", "ぬ"),(  "pu", "ぷ"),(  "ru", "る"),(  "su", "す"),(  "yu", "ゆ"),(  "zu", "ず"),( "u", "う"),( "v", "ゔ")]
    
    static func translateYomi(yomi:String)->String{
        var translatedString = yomi
        for kvp in GanaTranslater.characterSet{
            translatedString = translatedString.stringByReplacingOccurrencesOfString(kvp.0, withString: kvp.1, options: NSStringCompareOptions.allZeros, range: nil)
        }
        return translatedString
    }
    static func translateRomanji(romanji:String)->String{
        var translatedString = romanji
        for kvp in GanaTranslater.reverseCharacterSet{
            translatedString = translatedString.stringByReplacingOccurrencesOfString(kvp.0, withString: kvp.1, options: NSStringCompareOptions.allZeros, range: nil)
        }
        return translatedString
    }
}
