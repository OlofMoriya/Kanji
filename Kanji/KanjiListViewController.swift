//
//  KanjiListViewController.swift
//  Kanji
//
//  Created by Olof Olsson on 07/08/15.
//  Copyright (c) 2015 Olof Moriya. All rights reserved.
//

import UIKit
import CoreData

class KanjiListViewController: UIViewController, UITableViewDataSource, UISearchResultsUpdating, UITableViewDelegate, UISearchBarDelegate, UIGestureRecognizerDelegate{

    @IBOutlet weak var tableView: UITableView!
    var searchController = UISearchController()
    
    var animatedKanji: [Kanji] = []
    var filteredTableData:[Kanji] = []
    var floatingLabels:[UILabel:Kanji] = [:]
    
    let kanjiListCellIdentifier = "KanjiListCell"
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)        
        loadAnimatedKanji()
    }
    
    func loadAnimatedKanji(){
        let entityDescription = NSEntityDescription.entityForName("Kanji", inManagedObjectContext: managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        request.fetchLimit = 100
        
        var error: NSError?
        var objects = managedObjectContext?.executeFetchRequest(request,
            error: &error)

        animatedKanji = objects as! [Kanji]
        startAnimations()
    }
    
    func startAnimations(){
        if animatedKanji.count == 0{
            dispatch_after(NSEC_PER_SEC, dispatch_get_main_queue(), { () -> Void in
                self.loadAnimatedKanji()
            })
            return
        }
        
        for i in 1...8{
            startAnimation()
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        floatingLabels = [:]
    }
    
    func startAnimation(){
        var random = Int(arc4random_uniform(UInt32(animatedKanji.count)))
        let kanjiData = self.animatedKanji[random]
        
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
    
    func pushDetails(kanjiData: Kanji){
        let detailsViewController = KanjiDetailsViewController(nibName: "KanjiDetailsViewController", bundle:nil)
        detailsViewController.kanjiData = kanjiData
        navigationController?.pushViewController(detailsViewController, animated: true)
    }

//MARK: UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController){
        filteredTableData.removeAll(keepCapacity: false)
        if let searchString = searchController.searchBar.text where searchString != ""{
            
            let entityDescription = NSEntityDescription.entityForName("Kanji", inManagedObjectContext: managedObjectContext!)
            
            let request = NSFetchRequest()
            request.entity = entityDescription
            
            let pred = NSPredicate(format: "searchString contains[c] %@", searchString)
            request.predicate = pred
            
            var error: NSError?
            
            var objects = managedObjectContext?.executeFetchRequest(request, error: &error)

            if let kanjis = objects as? [Kanji]{
                filteredTableData = kanjis
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
        
        var kanjiData:Kanji
        kanjiData = filteredTableData[indexPath.row]
        
        cell.kanjiLabel.text = kanjiData.kanji
        cell.yomiLabel.text = kanjiData.yomi
        if let translations = kanjiData.translations as? [String]{
            cell.translationLabel.text = ", ".join(translations)
        }
        
        
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
