//
//  Data.swift
//  Kanji
//
//  Created by Olof Olsson on 08/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit

struct Data{
    static var kanjiData: [KanjiData] = []
    
    static func loadBaseKanji(){
        Data.kanjiData = [
            KanjiData(kanji: "飲む", kunyomi: "のむ", onyomi:"", translations: ["to drink"], similarKanji: nil, parts: ["飲"]),
            KanjiData(kanji: "行く", kunyomi: "いく", onyomi:"", translations: ["to go"], similarKanji: nil, parts: ["行"]),
            KanjiData(kanji: "来る", kunyomi: "くる", onyomi:"", translations: ["to come"], similarKanji: nil, parts: ["来"]),
            KanjiData(kanji: "働く", kunyomi: "はたらく", onyomi:"", translations: ["to work"], similarKanji: nil, parts: ["働"]),
            KanjiData(kanji: "見る", kunyomi: "みる", onyomi:"", translations: ["to see"], similarKanji: ["目"], parts: ["見"]),
            KanjiData(kanji: "目", kunyomi: "め", onyomi:"ミ", translations: ["eye"], similarKanji: ["見る"], parts: nil),
            KanjiData(kanji: "食", kunyomi: "く, た, は", onyomi:"", translations: ["food", "eat"], similarKanji: nil, parts: nil),
            KanjiData(kanji: "食べる", kunyomi: "たべる", onyomi:"", translations: ["to eat"], similarKanji: nil, parts: ["食"]),
            KanjiData(kanji: "物", kunyomi: "もの", onyomi:"", translations: ["thing"], similarKanji: nil, parts: nil),
            KanjiData(kanji: "食べ物", kunyomi: "たべもの", onyomi:"", translations: ["food"], similarKanji: nil, parts: ["食", "物"]),
            KanjiData(kanji: "書く", kunyomi: "かく", onyomi:"", translations: ["to write"], similarKanji: nil, parts: ["書"]),
            KanjiData(kanji: "事", kunyomi: "こと, ごと", onyomi:"ジ", translations: ["thing", "matter", "fact"], similarKanji: ["書く"], parts: nil),
            KanjiData(kanji: "仕", kunyomi: "つか", onyomi:"シ, ジ", translations: ["attend", "doing", "serve"], similarKanji: nil, parts: nil),
            KanjiData(kanji: "仕事", kunyomi: "しごと", onyomi:"", translations: ["work"], similarKanji: ["書く"], parts: ["仕", "事"])
                        ]
        
        for data in dataBlobOne{
            data.kunyomi = GanaTranslater.translateRomanji(data.kunyomi.lowercaseString)
            data.onyomi = GanaTranslater.translateRomanji(data.onyomi.lowercaseString)
            data.romanji = data.romanji.lowercaseString
        }
        
        kanjiData += dataBlobOne
    }
    //"borrowed" from http://nihongoichiban.com/2011/04/10/complete-list-of-kanji-for-jlpt-n5/
    static var dataBlobOne = [KanjiData(kanji:"安",kunyomi:"yasu(i)", onyomi:"AN", translations: ["peace"," cheap"," safety"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"一",kunyomi:"hito(tsu), hito-", onyomi:"ICHI, ITSU", translations: ["one"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"飲",kunyomi:"no(mu)", onyomi:"IN", translations: ["to drink"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"右",kunyomi:"migi", onyomi:"U, YUU", translations: ["right"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"雨",kunyomi:"ame", onyomi:"U", translations: ["rain"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"駅",kunyomi:"–", onyomi:"EKI", translations: ["station"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"円",kunyomi:"maru(i)", onyomi:"EN", translations: ["circle"," Yen"," round"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"火",kunyomi:"hi", onyomi:"KA", translations: ["fire"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"花",kunyomi:"hana", onyomi:"KA", translations: ["flower"," blossom"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"下",kunyomi:"shimo, sa(geru), o(rosu), ku(daru)", onyomi:"KA, GE", translations: ["below"," down"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"何",kunyomi:"nani", onyomi:"KA", translations: ["what"," how many"," which"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"会",kunyomi:"a(u)", onyomi:"KAI, E", translations: ["to meet"," to come together"," society"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"外",kunyomi:"soto, hoka, hazu(reru), hazu(su)", onyomi:"GAI, GE", translations: ["outside"," other"," disconnect"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"学",kunyomi:"mana(bu)", onyomi:"GAKU", translations: ["school"," science"," learning"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"間",kunyomi:"aida", onyomi:"KAN, KEN", translations: ["time"," time span"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"気",kunyomi:"–", onyomi:"KI, KE", translations: ["soul"," spirit"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"九",kunyomi:"kokono(tsu), kokono-", onyomi:"KYUU, KU", translations: ["nine"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"休",kunyomi:"yasu(mu)", onyomi:"KYUU", translations: ["to rest"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"魚",kunyomi:"sakana, uo", onyomi:"GYO", translations: ["fish"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"金",kunyomi:"kane", onyomi:"KIN, KON", translations: ["gold"," metal"," money"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"空",kunyomi:"sora, a(keru), kara", onyomi:"KUU", translations: ["sky"," to become free"," empty"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"月",kunyomi:"tsuki", onyomi:"GETSU, GATSU", translations: ["month"," moon"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"見",kunyomi:"mi(ru), mi(eru), mi(seru)", onyomi:"KEN", translations: ["to see"," to be visible"," to show"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"言",kunyomi:"i(u)", onyomi:"GEN, GON", translations: ["word"," to talk"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"古",kunyomi:"furu(i)", onyomi:"KO", translations: ["old"," used"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"五",kunyomi:"itsu(tsu), itsu-", onyomi:"GO", translations: ["five"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"後",kunyomi:"ato, oku(reru), nochi", onyomi:"GO, KOU", translations: ["after"," later"," back"," to stay behind"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"午",kunyomi:"–", onyomi:"GO", translations: ["noon"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"語",kunyomi:"kata(ru), kata(rau)", onyomi:"GO", translations: ["word"," to talk"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"校",kunyomi:"–", onyomi:"KOU", translations: ["school"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"口",kunyomi:"kuchi", onyomi:"KOU, KU", translations: ["mouth"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"行",kunyomi:"i(ku), yu(ku), okona(u)", onyomi:"KOU", translations: ["to walk. to go"," to do"," to carry out"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"高",kunyomi:"taka(i), taka(maru), taka(meru)", onyomi:"KOU", translations: ["high"," expensive"," increase"," quantity"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"国",kunyomi:"kuni", onyomi:"KOKU", translations: ["country"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"今",kunyomi:"ima", onyomi:"KON, KIN", translations: ["now"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"左",kunyomi:"hidari", onyomi:"SA", translations: ["left"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"三",kunyomi:"mit(tsu), mi-", onyomi:"SAN", translations: ["three"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"山",kunyomi:"yama", onyomi:"SAN", translations: ["mountain"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"四",kunyomi:"yo(ttsu), yu(tsu), yo-, yon-", onyomi:"SHI", translations: ["four"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"子",kunyomi:"ko", onyomi:"SHI, SU", translations: ["child"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"耳",kunyomi:"mimi", onyomi:"JI", translations: ["ear"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"時",kunyomi:"toki", onyomi:"JI", translations: ["time"," hour"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"七",kunyomi:"nana(tsu), nana-, nano-", onyomi:"SHICHI", translations: ["seven"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"車",kunyomi:"kuruma", onyomi:"SHA", translations: ["car"," wheel"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"社",kunyomi:"yashiro", onyomi:"SHA", translations: ["shinto shrine"," society"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"手",kunyomi:"te", onyomi:"SHU", translations: ["hand"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"週",kunyomi:"–", onyomi:"SHUU", translations: ["week"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"十",kunyomi:"too, to-", onyomi:"JUU, JI", translations: ["ten"," cross"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"出",kunyomi:"da(su), de(ru)", onyomi:"SHUTSU", translations: ["to leave"," to get out. to take out"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"書",kunyomi:"ka(ku)", onyomi:"SHO", translations: ["to write"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"女",kunyomi:"onna, me", onyomi:"JO, NYO", translations: ["woman"," female"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"小",kunyomi:"chii(sai), ko-, o-", onyomi:"SHOU", translations: ["small"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"少",kunyomi:"suko(shi), suku(nai)", onyomi:"SHOU", translations: ["a little"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"上",kunyomi:"ue, kami, a(geru), a(garu)", onyomi:"SHOU, JOU", translations: ["above"," upper"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"食",kunyomi:"ta(beru), ku(ru), ku(rau)", onyomi:"SHOKU", translations: ["to eat"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"新",kunyomi:"atara(shii), ara(ta), nii-", onyomi:"SHIN", translations: ["new"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"人",kunyomi:"hito", onyomi:"JIN, NIN", translations: ["person"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"水",kunyomi:"mizu", onyomi:"SUI", translations: ["water"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"生",kunyomi:"i(kiru), u(mu), ha(yasu), nama, ki", onyomi:"SEI, SHOU", translations: ["to live"," to grow"," to be born"," raw"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"西",kunyomi:"nishi", onyomi:"SEI, SAI", translations: ["west"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"川",kunyomi:"kawa", onyomi:"SEN", translations: ["river"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"千",kunyomi:"chi", onyomi:"SEN", translations: ["thousand"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"先",kunyomi:"saki", onyomi:"SEN", translations: ["before"," in future"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"前",kunyomi:"mae", onyomi:"ZEN", translations: ["before"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"足",kunyomi:"ashi, ta(riru), ta(su)", onyomi:"SOKU", translations: ["foot"," to be sufficient"," to add"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"多",kunyomi:"oo(i)", onyomi:"TA", translations: ["many"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"大",kunyomi:"ou(kii), oo(i)", onyomi:"DAI, TAI", translations: ["big"," a lot"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"男",kunyomi:"otoko", onyomi:"DAN, NAN", translations: ["man"," male"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"中",kunyomi:"naka", onyomi:"CHUU", translations: ["inner"," center"," between"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"長",kunyomi:"naga(i)", onyomi:"CHOU", translations: ["long"," leader"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"天",kunyomi:"ame, ama", onyomi:"TEN", translations: ["sky"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"店",kunyomi:"mise", onyomi:"TEN", translations: ["shop"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"電",kunyomi:"–", onyomi:"DEN", translations: ["electricity"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"土",kunyomi:"tsuchi", onyomi:"DO, TO", translations: ["earth"," ground"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"東",kunyomi:"higashi", onyomi:"TOU", translations: ["east"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"道",kunyomi:"michi", onyomi:"DOU", translations: ["street"," path"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"読",kunyomi:"yo(mu)", onyomi:"DOKU", translations: ["to read"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"南",kunyomi:"minami", onyomi:"NAN", translations: ["south"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"ニ",kunyomi:"futa(tsu), futa-", onyomi:"NI", translations: ["two"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"日",kunyomi:"hi, -ka", onyomi:"NICHI, JITSU", translations: ["day"," sun"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"入",kunyomi:"hai(ru), i(ru), i(reru)", onyomi:"NYUU", translations: ["to enter"," to insert"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"年",kunyomi:"toshi", onyomi:"NEN", translations: ["year"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"買",kunyomi:"ka(u)", onyomi:"BAI", translations: ["to buy"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"白",kunyomi:"shiro(i), shiro", onyomi:"HAKU, BYAKU", translations: ["white"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"八",kunyomi:"yat(tsu), ya(tsu), ya-, you-", onyomi:"HACHI", translations: ["eight"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"半",kunyomi:"naka(ba)", onyomi:"HAN", translations: ["half"," middle"," semi-"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"百",kunyomi:"–", onyomi:"HYAKU", translations: ["hundred"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"父",kunyomi:"chichi", onyomi:"FU", translations: ["father"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"分",kunyomi:"wa(keru), wa(kareru), wa(karu)", onyomi:"BUN, BU, FUN", translations: ["part"," minute"," to divide"," to understand"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"聞",kunyomi:"ki(ku), ki(koeru)", onyomi:"BUN, MON", translations: ["to hear"," to listen"," to ask"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"母",kunyomi:"haha", onyomi:"BO", translations: ["mother"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"北",kunyomi:"kita", onyomi:"HOKU", translations: ["north"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"木",kunyomi:"ki, ko", onyomi:"BOKU, MOKU", translations: ["tree"," wood"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"本",kunyomi:"moto", onyomi:"HON", translations: ["book"," source"," main-"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"毎",kunyomi:"–", onyomi:"MAI", translations: ["each"," every"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"万",kunyomi:"–", onyomi:"MAN, BAN", translations: ["ten thousand"," all"," many"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"名",kunyomi:"na", onyomi:"MEI, MYOU", translations: ["name"," reputation"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"目",kunyomi:"me", onyomi:"MOKU", translations: ["eye"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"友",kunyomi:"tomo", onyomi:"YUU", translations: ["friend"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"来",kunyomi:"ku(ru), kita(ru), kita(su)", onyomi:"RAI", translations: ["to come"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"立",kunyomi:"ta(tsu), ta(teru)", onyomi:"RITSU", translations: ["to stand"," to establish"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"六",kunyomi:"mutt(su), mu(tsu), mu, mui", onyomi:"ROKU", translations: ["six"],similarKanji:nil, parts:nil),
        KanjiData(kanji:"話",kunyomi:"hanashi, hana(su)", onyomi:"WA", translations: ["speech"," to talk"," story"," conversation"],similarKanji:nil, parts:nil)]
}
