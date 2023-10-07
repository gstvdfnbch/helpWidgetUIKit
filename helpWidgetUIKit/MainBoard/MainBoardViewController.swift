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
//        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-07", ofType: "csv") ?? "")
//        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-08", ofType: "csv") ?? "")
//        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-09", ofType: "csv") ?? "")
//        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-10", ofType: "csv") ?? "")
        
        
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
       guard let section = purchaseManagerCenter.months.last?.dashBoard.dashBoardList[section].itens else { return 0 }
       return section.count/2 //define o numero de linhas na tabela
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return purchaseManagerCenter.months.last?.dashBoard.dashBoardList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleSectionComponent.identifier) as! TitleSectionCell
            
        
        cell.titleSection.configureImageAndText(infos: InfosDashBoard(title: purchaseManagerCenter.months.last?.dashBoard.dashBoardList[section].title ?? "",typeComp: DashboardItem.nonClick, valueDouble: 0))

            return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DoubleColumn.identifier, for: indexPath) as! DoubleColumn
          
        if let infos = purchaseManagerCenter.months.last?.dashBoard.dashBoardList[indexPath.section].itens {
            let tapGestureLeft = UITapGestureRecognizer(target: self, action: #selector(handleComponentTap(_:)))
            let tapGestureRight = UITapGestureRecognizer(target: self, action: #selector(handleComponentTap(_:)))


            if let infoLeft = purchaseManagerCenter.months.last {
                let info = infoLeft.dashBoard.infosDashBoard(index: infos[indexPath.row * 2].rawValue)
                cell.leftComponent.addGestureRecognizer(tapGestureLeft)
                cell.leftComponent.tag = info.typeComp.rawValue
                cell.leftComponent.configureImageAndText(infos: info)
            }
           

            if let infoLeft = purchaseManagerCenter.months.last {
                let info = infoLeft.dashBoard.infosDashBoard(index: infos[indexPath.row * 2 + 1].rawValue)

                cell.rightComponent.addGestureRecognizer(tapGestureRight)
                cell.rightComponent.tag = info.typeComp.rawValue
                cell.rightComponent.configureImageAndText(infos: info)
            }

            
        }
    
        return cell
    }
    
    @objc func handleComponentTap(_ sender: UITapGestureRecognizer) {
        if let tappedView = sender.view {
            let sideRawValue = tappedView.tag
               
            switch DashboardItem(rawValue: sideRawValue) {
            case .startBalance:
                print("Você selecionou Start Balance")
            case .actualBalance:
                print("Você selecionou Actual Balance")
            case .averageGoal:
                print("Você selecionou Average Goal")
            case .spentSoFar:
                print("Você selecionou Spent So Far")
            case .averageLeftOver:
                print("Você selecionou Average Left Over")
            case .averageSpent:
                print("Você selecionou Average Spent")
            case .today:
                print("Você selecionou Today")
            case .yesterday:
                print("Você selecionou Yesterday")
            case .nonClick:
                print("Você selecionou Non-Click")
            default:
                print("Seleção não reconhecida")
            }
        }
    }
}


