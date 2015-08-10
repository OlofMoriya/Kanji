//
//  KanjiListViewController.swift
//  Kanji
//
//  Created by Olof Olsson on 07/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit

class KanjiListViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating, UITableViewDelegate, UISearchBarDelegate, UIGestureRecognizerDelegate{

    @IBOutlet weak var tableView: UITableView!
    var searchController = UISearchController()
    
    let tableData = Data.kanjiData
    var filteredTableData:[KanjiData] = []
    var floatingLabels:[UILabel:KanjiData] = [:]
    
    let kanjiListCellIdentifier = "KanjiListCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Kanji"
        
        tableView.registerNib(UINib(nibName: kanjiListCellIdentifier, bundle: NSBundle.mainBundle()), forCellReuseIdentifier: kanjiListCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        searchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.delegate = self
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        var tapRecognizer = UITapGestureRecognizer(target: self, action: "viewTapped:")
        view.addGestureRecognizer(tapRecognizer)
        tapRecognizer.delegate = self
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        startAnimations()
    }
    
    func startAnimations(){
        for i in 1...8{
            startAnimation()
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        floatingLabels = [:]
    }
    
    func startAnimation(){
        var random = Int(arc4random_uniform(UInt32(tableData.count)))
        let kanjiData = self.tableData[random]
        
        let label = UILabel()
        label.textColor = Colors.mainColor
        label.text = kanjiData.kanji
        floatingLabels[label] = kanjiData
        
        var randomY = CGFloat(arc4random_uniform(UInt32(UIScreen.mainScreen().bounds.height - 150)))

        var randomFontSize = CGFloat(arc4random_uniform(10) + 15)
        label.font = UIFont.boldSystemFontOfSize(randomFontSize)
        label.frame.origin = CGPointMake(UIScreen.mainScreen().bounds.width, randomY + 120)
        label.sizeToFit()
        view.addSubview(label)

        UIView.animateWithDuration(Double(arc4random_uniform(40) + 10), animations: { () -> Void in
            label.frame.origin.x = -label.frame.width

        }, completion: { (completed) -> Void in
            label.removeFromSuperview()
            self.floatingLabels[label] = nil
            if completed{
                self.startAnimation()
            }
        })
    }
    
    func viewTapped(recognizer : UIRotationGestureRecognizer){
        for (label, kanjiData) in floatingLabels{
            var layer = (label.layer.presentationLayer() as! CALayer)
            if layer.hitTest(recognizer.locationInView(view)) != nil{
                pushDetails(kanjiData)
            }
        }
    }
    
    func pushDetails(kanjiData: KanjiData){
        let detailsViewController = KanjiDetailsViewController(nibName: "KanjiDetailsViewController", bundle:nil)
        detailsViewController.kanjiData = kanjiData
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

//MARK: UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController){
        filteredTableData.removeAll(keepCapacity: false)
        if let searchString = searchController.searchBar.text where searchString != ""{
            let searchPredicate = NSPredicate(format: "(kanji contains[c] %@) OR (yomi contains[c] %@) OR (romanji contains[c] %@) OR (any translations contains[c] %@)", searchString, searchString, searchString, searchString)
            if let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate) as? [KanjiData]{
                filteredTableData = array
            }
        }
        self.tableView.reloadData()
    }
    
//MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if (searchController.active) {
            return filteredTableData.count
        }
        else {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier(kanjiListCellIdentifier, forIndexPath: indexPath) as! KanjiListCell
        
        var kanjiData:KanjiData
        if (searchController.active) {
            kanjiData = filteredTableData[indexPath.row]
        }else{
            kanjiData = tableData[indexPath.row]
        }
        
        cell.kanjiLabel.text = kanjiData.kanji
        cell.yomiLabel.text = kanjiData.yomi
        cell.translationLabel.text = ", ".join(kanjiData.translations)
        
        return cell
    }
    
//MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        //Need to select the data before dismissing the search controller
        let kanjiData = filteredTableData[indexPath.row]
        searchController.active = false
        
        pushDetails(kanjiData)
    }
    
//MARK: UISearchBarDelegate
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        for floatingLabel in floatingLabels{
            floatingLabel.0.removeFromSuperview()
        }
        floatingLabels = [:]
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        startAnimations()
    }
    
//MARK; UIGestureRecognizer
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
        if(touch.view is UITableViewCell) {
            return false
        }
        // UITableViewCellContentView => UITableViewCell
        if(touch.view.superview is UITableViewCell) {
            return false
        }
        // UITableViewCellContentView => UITableViewCellScrollView => UITableViewCell
        if(touch.view.superview?.superview is UITableViewCell) {
            return false;
        }
        return true;
    }
}
