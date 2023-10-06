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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleSectionComponent.identifier, for: indexPath) as! TitleSectionCell

       
        cell.titleSection.configureImageAndText(infos: InfosDashBoard(title: "gustavo", valueDouble: 90))       
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: DoubleColumn.identifier, for: indexPath) as! DoubleColumn
  
//        cell.selectionStyle = .none
//        
//        cell.leftComponent.configureImageAndText(infos: dashBoardList[indexPath.row * 2])
//
//        cell.rightComponent.configureImageAndText(infos: dashBoardList[indexPath.row * 2 + 1])
        
        print(indexPath)
        return cell
    }
}


