//
//  Todo.swift
//  ippei.study.todo
//
//  Created by 高橋一平 on 2015/06/10.
//  Copyright (c) 2015年 高橋一平. All rights reserved.
//

import Foundation

//12 NSCodingを実装
class Todo: NSObject, NSCoding {
    let desc: String
    let createdAt: NSDate
    
    var done: Bool
    
    init(description: String) {
        desc = description
        done = false
        createdAt = NSDate()
    }
    
    //12 NSCodingを実装
    @objc func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(desc, forKey: "description")
        aCoder.encodeObject(createdAt, forKey: "createdAt")
        aCoder.encodeBool(done, forKey: "done")
    }
    
    @objc required init(coder aDecoder: NSCoder) {
        desc = aDecoder.decodeObjectForKey("description") as! String
        createdAt = aDecoder.decodeObjectForKey("createdAt") as! NSDate
        
        done = aDecoder.decodeBoolForKey("done")
    }
}