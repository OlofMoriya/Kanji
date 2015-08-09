//
//  Style.swift
//  Kanji
//
//  Created by Olof Olsson on 08/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit

struct Colors{
    static var mainColor = UIColor(red: 70.0/255.0, green: 146.0/255.0, blue: 135.0/255.0, alpha: 1)
    static var grey = UIColor(red: 201.0/255.0, green: 201.0/255.0, blue: 206.0/255.0, alpha: 1)
    static var defaultTint = UIColor.whiteColor()
}

class Style {
    
    static func setAppStyle(){
        UINavigationBar.appearance().barTintColor = Colors.mainColor
        UIButton.appearance().tintColor = Colors.defaultTint
        UISearchBar.appearance().tintColor = Colors.defaultTint
        UINavigationBar.appearance().tintColor = Colors.defaultTint
        
    }
   
}
