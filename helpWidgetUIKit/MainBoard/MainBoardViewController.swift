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
        
        self.navigationController?.navigationBar.tintColor = .label
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        if let color = UIColor(named: "shadowColor")?.cgColor {
            self.navigationController?.navigationBar.layer.shadowColor = color
        }
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer.shadowOffset = .zero
        self.navigationController?.navigationBar.layer.shadowRadius = 3
        
        self.addNavigatorButtons()
        
        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-06", ofType: "csv") ?? "")
        //        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-07", ofType: "csv") ?? "")
        //        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-08", ofType: "csv") ?? "")
        //        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-09", ofType: "csv") ?? "")
        //        purchaseManagerCenter.importFromCSV(filePath: Bundle.main.path(forResource: "nubank-2023-10", ofType: "csv") ?? "")
        
        
        //purchaseManagerCenter.debugGSTV()
    }
    
    func addNavigatorButtons() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"), style: .done, target: self, action: #selector(addPurchaseSegueFunc))
    }
    
    @objc func addPurchaseSegueFunc() {
        self.performSegue(withIdentifier: addPurchaseSegue, sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == purchaseListSegue {
            guard let destination = segue.destination as? PurchaseListViewController else { return }
            guard let senderList = sender as? TableViewPurchaseList else { return }
            
            destination.purchaseList = senderList
        } else if segue.identifier == addPurchaseSegue {
            print(addPurchaseSegue)
//            guard let destination = segue.destination as? PurchaseListViewController else { return }
//            guard let senderList = sender as? [Purchase] else { return }
//            
//            destination.purchaseList = senderList
            
        }
        
    }
    
}

extension MainBoardViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
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
        
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleMonthComponentTableViewCell.identifier) as! TitleMonthComponentTableViewCell
            
            if let month = purchaseManagerCenter.months.last {
                cell.sendTextTitle(title: month.dashBoard.dashBoardList[section].title)
            }
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleSectionComponent.identifier) as! TitleSectionCell
            
            if let month = purchaseManagerCenter.months.last {
                cell.sendTextTitle(title: month.dashBoard.dashBoardList[section].title)
            }
            
            return cell
        }
        
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
                if let listSender = purchaseManagerCenter.months.last {
                    performSegue(withIdentifier: purchaseListSegue, 
                                 sender: TableViewPurchaseList( title: listSender.monthYearString(),
                                                                purchaseList: listSender.purchases ))
                }
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


