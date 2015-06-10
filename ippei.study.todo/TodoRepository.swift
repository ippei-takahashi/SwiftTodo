//
//  TodoRepository.swift
//  ippei.study.todo
//
//  Created by 高橋一平 on 2015/06/10.
//  Copyright (c) 2015年 高橋一平. All rights reserved.
//

import Foundation

// 13 データ永続化のためのレポジトリを作成
class TodoRepository {
    static let paths1 = NSSearchPathForDirectoriesInDomains(
        .DocumentDirectory,
        .UserDomainMask, true)
    static let path = paths1[0].stringByAppendingPathComponent("todo.dat")
    
    class func storeData(todoList: [Todo]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(todoList, toFile: path)
    }
    
    class func restoreData() -> [Todo] {
        if let todoList = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? [Todo] {
            return todoList
        } else {
            return []
        }
        
    }
}
