//
//  Todo.swift
//  ippei.study.todo
//
//  Created by 高橋一平 on 2015/06/10.
//  Copyright (c) 2015年 高橋一平. All rights reserved.
//

import Foundation

//8 Todoをクラス化
class Todo {
    let description: String
    let createdAt: NSDate
    
    var done: Bool
    
    init(description: String) {
        self.description = description
        done = false
        createdAt = NSDate()
    }
    
}