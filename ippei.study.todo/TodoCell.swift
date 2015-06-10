//
//  TodoCell.swift
//  ippei.study.todo
//
//  Created by 高橋一平 on 2015/06/10.
//  Copyright (c) 2015年 高橋一平. All rights reserved.
//

import UIKit

// 10 セルをクラス化
class TodoCell: UITableViewCell {
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var createdAtLabel: UILabel!
    
    @IBAction func doneButtonPushed() {
        todo?.done = true
        updateLabels()
    }
    
    var todo: Todo? {
        // todoがセットされたらラベルを更新する
        didSet {
            updateLabels()
        }
    }
    
    private func updateLabels() {
        if let todo = todo {
            let attributes: [NSObject: AnyObject]? = todo.done ? [
                NSStrikethroughStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue
                ] : nil
            let description = NSMutableAttributedString(string: todo.description, attributes: attributes)
            
            descriptionLabel.attributedText = description
            
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            let dateString =  dateFormatter.stringFromDate(todo.createdAt)
            
            createdAtLabel.text = dateString
        }
    }
}

