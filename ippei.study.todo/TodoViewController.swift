
//
//  TodoViewController.swift
//  ippei.study.todo
//
//  Created by 高橋一平 on 2015/06/09.
//  Copyright (c) 2015年 高橋一平. All rights reserved.
//

import UIKit

class TodoViewController: UIViewController {
    
    // 1 tableViewへの参照
    @IBOutlet private weak var tableView: UITableView!
    
    // 2 todoList
    private var todoList: [String] = ["test1", "test2", "test3"]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 3 tableViewのイベントをハンドリング
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// 4 イベントハンドリング時に呼ぶメソッド
extension TodoViewController: UITableViewDataSource {
    // テーブルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    // indexPath.row行目のセルの内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "TodoCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellId)
        }
        
        cell?.textLabel?.text = todoList[indexPath.row]
        
        return cell!
    }
}
