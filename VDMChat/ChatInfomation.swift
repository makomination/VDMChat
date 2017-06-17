//
//  ChatInfomation.swift
//  VDMChat
//
//  Created by Makoto Ishihara on 2017-06-16.
//  Copyright © 2017 Tony. All rights reserved.
//

import Foundation
import UIKit

class ChatInformation: NSObject, Comparable {
    let message:String;
    let nickname:String;
    let time:Date;
    
    init(message: String, nickname: String, time: Double) {
        self.message = message
        self.nickname = nickname
        self.time = Date(timeIntervalSince1970: time);
    }
    
    
    static func < (lhs: ChatInformation, rhs: ChatInformation) -> Bool {
        return lhs.time < rhs.time
    }
    
    static func == (lhs: ChatInformation, rhs: ChatInformation) -> Bool {
        return lhs.time == rhs.time
    }
}
