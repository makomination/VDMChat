//
//  ChatBoard.swift
//  VDMChat
//
//  Created by Makoto Ishihara on 2017-06-14.
//  Copyright © 2017 Tony. All rights reserved.
//
import UIKit
import Foundation
import FirebaseDatabase

class ChatBoardViewController: UIViewController, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var textView: UITextView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("test")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Required for UITableVIewDataSource protocol
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell: UITableViewCell? = nil
        return tableViewCell!
    }
    
    //Required for UITableVIewDataSource protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
