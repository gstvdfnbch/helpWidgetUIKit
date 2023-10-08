//
//  PurchaseListViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import UIKit

struct TableViewPurchaseList {
    var title: String
    var purchaseList: [Purchase]
}

class PurchaseListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var purchaseList: TableViewPurchaseList = TableViewPurchaseList(title: "",purchaseList: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }

}

extension PurchaseListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension PurchaseListViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return purchaseList.purchaseList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleSectionCell.identifier) as! TitleSectionPurchaseListTableViewCell
        
        cell.titleMain.titleText.text = purchaseList.title

        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseItemCell.identifier, for: indexPath) as! PurchaseItemCell

        cell.sendInfos(purchaseList.purchaseList[purchaseList.purchaseList.count - (indexPath.row + 1)])
        
        return cell
    }
    
//    @objc func handleComponentTap(_ sender: UITapGestureRecognizer) {
//        if let tappedView = sender.view {
//            let sideRawValue = tappedView.tag
//               
//            switch DashboardItem(rawValue: sideRawValue) {
//            case .startBalance:
//                print("Você selecionou Start Balance")
//            case .actualBalance:
//                print("Você selecionou Actual Balance")
//            case .averageGoal:
//                print("Você selecionou Average Goal")
//            case .spentSoFar:
//                print("Você selecionou Spent So Far")
//            case .averageLeftOver:
//                print("Você selecionou Average Left Over")
//            case .averageSpent:
//                print("Você selecionou Average Spent")
//            case .today:
//                print("Você selecionou Today")
//            case .yesterday:
//                print("Você selecionou Yesterday")
//            case .nonClick:
//                print("Você selecionou Non-Click")
//            default:
//                print("Seleção não reconhecida")
//            }
//        }
//    }
}
