//
//  MainBoardViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 06/10/23.
//

import UIKit

class MainBoardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var purchaseManagerCenter: PurchaseManager = PurchaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-06", ofType: "csv") ?? "")
        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-07", ofType: "csv") ?? "")
        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-08", ofType: "csv") ?? "")
        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-09", ofType: "csv") ?? "")
        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-10", ofType: "csv") ?? "")
        
        
        purchaseManagerCenter.debugGSTV()
    }
    
}

extension MainBoardViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("tap here!")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MainBoardViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       guard let section = dashBoardList[section].itens else { return 0 }
       return section.count/2 //define o numero de linhas na tabela
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dashBoardList.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleSectionComponent.identifier) as! TitleSectionCell
            
            cell.titleSection.configureImageAndText(infos: InfosDashBoard(title: dashBoardList[section].title, valueDouble: 90))
            
            return cell

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DoubleColumn.identifier, for: indexPath) as! DoubleColumn
  
        cell.selectionStyle = .none
        
        if let infos = dashBoardList[indexPath.section].itens {
            
            cell.leftComponent.configureImageAndText(infos: infos[indexPath.row * 2])
            cell.rightComponent.configureImageAndText(infos: infos[indexPath.row * 2 + 1])
            
        }
    
        return cell
    }
}


