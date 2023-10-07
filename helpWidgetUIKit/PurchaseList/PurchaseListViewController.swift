//
//  PurchaseListViewController.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import UIKit


class PurchaseListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var purchaseList: [Purchase] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }

}


extension PurchaseListViewController: UITableViewDelegate{
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension PurchaseListViewController: UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5//purchaseList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = tableView.dequeueReusableCell(withIdentifier: TitleSectionComponent.identifier) as! TitleSectionCell
//        
//        
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseItem.identifier, for: indexPath) as! PurchaseItemCell

        
        //cell.purchaseItem.configureContent(date: Date(), category: "", value: 2.0)
        //cell.purchaseItem.dateText.text = "Day 1"
        //cell.purchaseItem.categoryBox.backgroundColor = UIColor.systemBlue
        //cell.purchaseItem.valueText.text = "R$ 6.66"
        
        
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
