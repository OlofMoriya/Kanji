//
//  KanjiDetailsViewController.swift
//  Kanji
//
//  Created by Olof Olsson on 08/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit

enum KanjiDetailsSectionTitles: String{
    case Header = "Header"
    case Translation = "Translation"
    case Parts = "Parts"
    case Similar = "Similar"
}

class KanjiDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var kanjiData: KanjiData!
    
    @IBOutlet weak var tableView: UITableView!
    let sectionOneCellIdentifier = "cellOne"
    let sectionTwoCellIdentifier = "cellTwo"
    let sectionThreeCellIdentifier = "cellTwo"
    let sectionFourCellIdentifier = "cellTwo"
    
    var structure:[Int: (cellIdentifier: String, numberOfCells:Int, headerTitle:KanjiDetailsSectionTitles)] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        structure = [0: (sectionOneCellIdentifier, 3, KanjiDetailsSectionTitles.Header), 1: (sectionTwoCellIdentifier, kanjiData.translations.count, KanjiDetailsSectionTitles.Translation)]
        
        if let parts = kanjiData.parts where parts.count > 0{
            structure[structure.count] = (sectionThreeCellIdentifier, parts.count ?? 0, KanjiDetailsSectionTitles.Parts)
        }
        
        if let similar = kanjiData.similarKanji where similar.count > 0{
            structure[structure.count] = (sectionFourCellIdentifier, similar.count ?? 0, KanjiDetailsSectionTitles.Similar)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return structure.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return structure[section]!.numberOfCells
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if structure[indexPath.section]!.headerTitle == KanjiDetailsSectionTitles.Header{
            var cell = tableView.dequeueReusableCellWithIdentifier(sectionOneCellIdentifier) as? UITableViewCell
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: sectionOneCellIdentifier)
            }
            
            cell?.tintColor = Colors.mainColor
            cell?.textLabel?.font = UIFont.systemFontOfSize(8.0)
            
            if indexPath.row == 0{
                cell?.textLabel?.text = "Kunyomi"
                cell?.detailTextLabel?.text = kanjiData.kunyomi
            }else if indexPath.row == 1{
                cell?.textLabel?.text = "Onyomi"
                cell?.detailTextLabel?.text = kanjiData.onyomi
            }else if indexPath.row == 2{
                cell?.textLabel?.text = "Romanji"
                cell?.detailTextLabel?.text = kanjiData.romanji
            }
            
            return cell!
        }
        else if structure[indexPath.section]!.headerTitle == KanjiDetailsSectionTitles.Translation{
            var cell = tableView.dequeueReusableCellWithIdentifier(sectionTwoCellIdentifier) as? UITableViewCell
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: sectionTwoCellIdentifier)
            }
            
            cell?.textLabel?.text = kanjiData.translations[indexPath.row]
            
            return cell!
        }else if structure[indexPath.section]!.headerTitle == KanjiDetailsSectionTitles.Parts{
            var cell = tableView.dequeueReusableCellWithIdentifier(sectionTwoCellIdentifier) as? UITableViewCell
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: sectionTwoCellIdentifier)
            }
            
            cell?.textLabel?.text = kanjiData.parts?[indexPath.row]
            
            return cell!
        }else if structure[indexPath.section]!.headerTitle == KanjiDetailsSectionTitles.Similar{
            var cell = tableView.dequeueReusableCellWithIdentifier(sectionFourCellIdentifier) as? UITableViewCell
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: sectionFourCellIdentifier)
            }
            
            cell?.textLabel?.text = kanjiData.similarKanji?[indexPath.row]
            
            return cell!
        }
        else{
            //This else should never be run.
            NSException.raise("Exception", format:"Error: %@", arguments:getVaList(["nil"]))
            return UITableViewCell()
        }
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let kanjiHeader = NSBundle.mainBundle().loadNibNamed("KanjiHeaderView", owner: self, options: nil)[0] as! KanjiHeaderView
            kanjiHeader.kanjiLabel.text = kanjiData.kanji
            kanjiHeader.yomiLabel.text = kanjiData.yomi
            
            return kanjiHeader
        }
        else{
            return nil
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return structure[section]!.headerTitle.rawValue
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 121
        }
        else{
            return 20
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)

        var kanjiData: String?
        if structure[indexPath.section]!.headerTitle == KanjiDetailsSectionTitles.Similar{
            kanjiData = self.kanjiData.similarKanji![indexPath.row]
        }else if structure[indexPath.section]!.headerTitle == KanjiDetailsSectionTitles.Parts{
            kanjiData = self.kanjiData.parts![indexPath.row]
        }
        
        if let kanjiData = kanjiData{
            let searchPredicate = NSPredicate(format: "(kanji = %@) ", kanjiData)
            if let array = (Data.kanjiData as NSArray).filteredArrayUsingPredicate(searchPredicate) as? [KanjiData] where array.count > 0{
                let detailsViewController = KanjiDetailsViewController(nibName: "KanjiDetailsViewController", bundle:nil)
                detailsViewController.kanjiData = array[0] as KanjiData
                navigationController?.pushViewController(detailsViewController, animated: true)
            }
        }
    }
}
