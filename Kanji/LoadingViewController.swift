//
//  LoadingViewController.swift
//  TripExpense
//
//  Created by Olof Olsson on 12/08/15.
//  Copyright (c) 2015 Olof Olsson. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController, DataReaderDelegate {

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var kanjiLabel: UILabel!
    var readEntries:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.kanjiLabel.text = ""

        var reader = DataReader()
        reader.delegate = self
        dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.value), 0)) { // 1
            reader.loadBaseKanji()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: DataReaderDelegate

    func entryRead(kanji:String) {
        readEntries++
        dispatch_async(dispatch_get_main_queue()) { // 2
            self.progressView.progress = Float(self.readEntries) / 13108
            
            if(self.readEntries % 30 == 0){
                if (self.readEntries > 400){
                    self.kanjiLabel.text! = String(dropFirst(self.kanjiLabel.text!))
                }
                self.kanjiLabel.text! += kanji
            }
        }
    }
    
    func finishedParsing() {
        dispatch_async(dispatch_get_main_queue()) { // 2
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
