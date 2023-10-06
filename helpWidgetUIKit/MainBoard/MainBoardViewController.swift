//
//  MainBoardViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit

class MainBoardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension MainBoardViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("tap here!")
    }
}

extension MainBoardViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 //define o numero de linhas na tabela
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
//        let cell = tableView.dequeueReusableCell(withIdentifier: TitleMonthComponent.identifier, for: indexPath) as! TitleMonthComponentTableViewCell
        
//        cell.titleMonthComponentView.sendData(titleMnt: "asdas", subtitleMnt: "asdasd")
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DoubleColumn.identifier, for: indexPath) as! DoubleColumn
        
//        cell.startBalance.configureImageAndText(infos: dashBoardList[DashboardItem.startBalance.rawValue])
//
//        cell.actualBalance.configureImageAndText(infos: dashBoardList[DashboardItem.actualBalance.rawValue])
  
        cell.startBalance.configureImageAndText(infos: dashBoardList[indexPath.row * 2])

        cell.actualBalance.configureImageAndText(infos: dashBoardList[indexPath.row * 2 + 1])
        
        print(indexPath)
        return cell
    }
}


