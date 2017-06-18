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
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var textAreaLengthToBottom: NSLayoutConstraint!
    @IBOutlet weak var textAreaHeight: NSLayoutConstraint!
    
    var chatInfoArray:[ChatInformation] = [];
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //table initialization
        table.dataSource = self
        table.delegate = self
        table.rowHeight = UITableViewAutomaticDimension

        //textArea initialization
        textArea.delegate = self
        textArea.textContainer.lineBreakMode = NSLineBreakMode.byWordWrapping
        textArea.textContainer.maximumNumberOfLines = 8
        textArea.isScrollEnabled = false
        let tapForDissmissingKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ChatBoardViewController.dismissKeyboard))
        view.addGestureRecognizer(tapForDissmissingKeyboard)
        
        //initial setting of textArea's height
        var frameRect:CGRect = textArea.frame
        let size = textArea.sizeThatFits(CGSize(width: textArea.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        frameRect.size.height = size.height;
        textAreaHeight.constant = frameRect.size.height
        textArea.frame = frameRect
        
        //fetch data from Firebase
        let rootRef = Database.database().reference(withPath: GeneralManager.REF_ROOT_STRING);
        
        rootRef.observe(DataEventType.value, with: {snapshot in
            guard let snapshotValue = snapshot.value as? [String: AnyObject] else{
                return;
            }
            
            self.chatInfoArray.removeAll()
            
            for element in snapshotValue{
                var value = element.value as! [String:Any];
                print(value)
                
                let message = value["message"] as! String
                let nickname = value["nickname"] as! String
                let time = value["time"] as! Double
                self.chatInfoArray.append(ChatInformation.init(message: message, nickname: nickname, time: time))
            }
            self.chatInfoArray.sort(by:<);
            self.table.reloadData();
            self.table.scrollToBottom();
        })

    }
    
    override func viewDidLayoutSubviews() {
        textArea.setContentOffset(.zero, animated: false)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Required for UITableVIewDataSource protocol
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MessageCell")!
        return cell
    }
    
    //Required for UITableVIewDataSource protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func textViewDidChange(_ textView: UITextView){
        var frameRect:CGRect = textView.frame
        let size = textView.sizeThatFits(CGSize(width: textView.frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        frameRect.size.height = size.height;
        textAreaHeight.constant = frameRect.size.height
        textArea.frame = frameRect
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3, animations: {
                self.textAreaLengthToBottom.constant = keyboardSize.height;
                self.view.layoutIfNeeded()
            },completion: nil)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3, animations: {
            self.textAreaLengthToBottom.constant = 0;
            self.view.layoutIfNeeded()
        },completion: nil)
    }
    
    func dismissKeyboard() {

        view.endEditing(true)
    }

}


extension UITableView {
    func scrollToBottom() {
        let sections = numberOfSections-1
        if sections >= 0 {
            let rows = numberOfRows(inSection: sections)-1
            if rows >= 0 {
                let indexPath = IndexPath(row: rows, section: sections)
                DispatchQueue.main.async { [weak self] in
                    self?.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            }
        }
    }
}

