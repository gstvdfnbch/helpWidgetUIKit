//
//  PurchaseManager.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import Foundation

class PurchaseManager {

    var months: [Month]
    
    init() {
        self.months = []
    }

    //COMPRAS
    func addPurchase(monthInt: Int, year: Int, purchase: Purchase) {
        if let index = months.firstIndex(where: { $0.monthInt == monthInt && $0.year == year }) {
            months[index].addPurchase(purchase)
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateString = dateFormatter.string(from: purchase.date)
            
            let newMonth = Month(year: year, monthInt: monthInt, dashBoard: Dashboard(), purchases: [purchase], expensesPerDay: [dateString: purchase.amount])
            
            if let insertionIndex = months.firstIndex(where: { $0.year > year || ($0.year == year && $0.monthInt > monthInt) }) {
                months.insert(newMonth, at: insertionIndex)
            } else {
                months.append(newMonth)
            }
        }
    }
    
    func purchasesListOf(monthInt: Int) {
        for month in months {
            print(month.monthInt)
        }
    }
    
    //IMPORTS
    func importFromCSV(filePath: String) {
        do {
            let csvContent = try String(contentsOfFile: filePath)
            
            let rows = csvContent.split(separator: "\n")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            for row in rows {
                let columns = row.split(separator: ",")
                if columns.count == 4,
                   let amount = Double(columns[CSVColumns.amount.rawValue]),
                   amount >= 0, // Ensure amount is non-negative
                   let date = dateFormatter.date(from: String(columns[CSVColumns.date.rawValue])) {
                    
                    let purchase = Purchase(
                        date: date,
                        category: String(columns[CSVColumns.category.rawValue]),
                        title: String(columns[CSVColumns.title.rawValue]),
                        amount: amount
                    )
                    let monthNumber = Int(String(columns[CSVColumns.date.rawValue].prefix(7).split(separator: "-")[1])) ?? 0
                    let yearNumber = Int(String(columns[CSVColumns.date.rawValue].prefix(4))) ?? 0
                    addPurchase(monthInt: monthNumber, year: yearNumber, purchase: purchase)
                }
            }
        } catch {
            print("Erro importFromCSV - GSTV: \(error.localizedDescription)")
        }
    }
    
    
    func debugGSTV(){
        
//        print("Quantidade de Meses \(months.count)")
//        print("startBalance: \(self.months.last?.dashBoard.startBalance)")
//        print("actualBalance: \(self.months.last?.dashBoard.actualBalance)")
//        print("averageGoal: \(self.months.last?.dashBoard.averageGoal)")
//        print("spendSoFar: \(self.months.last?.dashBoard.spentSoFar)")
//        print("averageSpent: \(self.months.last?.dashBoard.averageSpent)")
//        print("averageLeftOver: \(self.months.last?.dashBoard.averageLeftOver)")
//        print("today: \(self.months.last?.dashBoard.today)")
//        print("yesterday: \(self.months.last?.dashBoard.yesterday)")
//        
        for month in months {
            print("Compras \(month.monthInt):  \(month.dashBoard.componentsList[DashboardItem.spentSoFar.rawValue])")
        }
    }
}
