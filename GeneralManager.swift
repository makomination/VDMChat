//
//  GeneralManager.swift
//  VDMChat
//
//  Created by Makoto Ishihara on 2017-06-16.
//  Copyright © 2017 Tony. All rights reserved.
//

import Foundation

class GeneralManager{
    static let sharedInstance: GeneralManager = GeneralManager();
    static let REF_ROOT_STRING = "chats"
    static let ANONYMOUS = "Anonymous"
    var nickname:String?
}
