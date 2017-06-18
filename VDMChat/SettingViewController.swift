//
//  SettingViewController.swift
//  VDMChat
//
//  Created by Makoto Ishihara on 2017-06-15.
//  Copyright © 2017 Tony. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var currentNicknameLabel: UILabel!
    @IBOutlet weak var nicknameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameField.delegate = self
        if let nickname = GeneralManager.sharedInstance.nickname,!nickname.isEmpty{
            currentNicknameLabel.text = nickname
        } else{
            currentNicknameLabel.text = GeneralManager.ANONYMOUS
        }
        let tapForDissmissingKeyboard: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tapForDissmissingKeyboard)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let nickname = nicknameField.text, !nickname.isEmpty{
            GeneralManager.sharedInstance.nickname = nickname
            currentNicknameLabel.text = nickname
            let userDefaults = UserDefaults.standard
            userDefaults.set(nickname, forKey: "nickname")
            userDefaults.synchronize()
        }
        else{
            return
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
