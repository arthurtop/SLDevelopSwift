//
//  LZRefreshViewController.swift
//  SLDevelopSwift
//
//  Created by songlei on 2017/1/11.
//  Copyright © 2017年 songlei. All rights reserved.
//

import UIKit

class LZRefreshViewController: UIViewController {
    
    @IBOutlet weak var refreshTableView: UITableView!
    
    fileprivate var numRows = 5
    fileprivate var PERSON_ID_NUMBER_PROPERTY = UnsafeRawPointer.init(bitPattern: "Instance".hashValue)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
    }
    
    
    
    
    
    
}

// MARK: -- xlz 设置UI
extension LZRefreshViewController {
    
    func setupUI() {
        
        title = "下拉刷新"
        
        view.addSubview(refreshTableView)
        
        
        weak var weakSelf = self
        
        refreshTableView.refreshHeader = LCRefreshHeader.init(refreshBlock: {
            print("header")
            weakSelf!.perform(#selector(LZRefreshViewController.headerRefresh), with: nil, afterDelay: 2)
        })
        
        refreshTableView.refreshFooter = LCRefreshFooter.init(refreshBlock: {
            print("footer")
            weakSelf!.perform(#selector(LZRefreshViewController.footerRefresh), with: nil, afterDelay: 2)
        })
        
        refreshTableView.tableFooterView = UIView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 5))
        
    }
    
    
    
}


// MARK: -- xlz ----- 下拉  上提 刷新
extension LZRefreshViewController{
    
    func headerRefresh() {
        
        weak var weakSelf = self
        
        if weakSelf!.refreshTableView.isHeaderRefreshing() {
            weakSelf!.refreshTableView.endHeaderRefreshing()
        }
        
        weakSelf!.numRows = 5
        weakSelf!.refreshTableView.reloadData()
        
        weakSelf!.refreshTableView.resetDataLoad()
    }
    
    func footerRefresh() {
        weak var weakSelf = self
        
        if weakSelf!.refreshTableView.isFooterRefreshing() {
            weakSelf!.refreshTableView.endFooterRefreshing()
        }
        weakSelf!.numRows += 5
        weakSelf!.refreshTableView.reloadData()
        
        if numRows > 20 {
            weakSelf!.refreshTableView.setDataLoadover()
        }
    }

    
    
}





// MARK: -- xlz tabelView datasource delegate
extension LZRefreshViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numRows
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init()
        cell.textLabel?.text = "label\(indexPath.row)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vi = UIView.init()
        vi.backgroundColor = UIColor.lightGray
        return vi
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30;
    }
    
}











