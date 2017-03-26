//
//  ViewController.swift
//  SLDevelopSwift
//
//  Created by songlei on 2017/1/11.
//  Copyright © 2017年 songlei. All rights reserved.
//

import UIKit

let tableViewCellId = "tableViewCellId"



class ViewController: UIViewController {
    
    fileprivate lazy var tableView : UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH), style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellId)
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
        
    }
    
    
}


// MARK: -- xlz 设置UI
extension ViewController {
    
    func setupUI() {
        
        view.addSubview(tableView)
        
    }
    
    
}


// MARK: -- xlz tableView delegate datasource

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId, for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.textLabel?.text = "小磊子"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            //let personVC = LZRefreshViewController()
            //navigationController?.pushViewController(personVC, animated: true)
            
            
        }
        
    }
    
    
}

