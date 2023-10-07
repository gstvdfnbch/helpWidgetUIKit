//
//  PurchaseManager.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import Foundation

// Define a structure to represent each individual purchase.
struct Purchase {
    let date: Date
    let category: String
    let title: String
    let amount: Double
}

struct Dashboard{

    var componentsListValues: [(Double, Double)] = Array(repeating: (0.0, 0.0), count: dashboarCount)
    
    
    var componentsList: [InfosDashBoard] = [
        InfosDashBoard(title: "Start Balance", iconImage: "start", valueDouble: 0.0),
        InfosDashBoard(title: "Actual Balance", iconImage: "wallet", valueDouble: 0.0),
        InfosDashBoard(title: "Average\nGoal", iconImage: "target", valueDouble: 0.0, subtitleString: "This is THE right way! :)"),
        InfosDashBoard(title: "Spent\nSo Far", iconImage: "expenses", valueDouble: 0.0, subtitleString: "Remeber to save money."),
        
        InfosDashBoard(title: "Average\nSpent", modeIcon: ModeIcon.percentInv, valueDouble: 0.0, percentValue: 0.0, unit: "/ day", subtitleString: "Average daily spending you have done so far."),
        InfosDashBoard(title: "Average \nLeft Over", modeIcon: ModeIcon.percent, valueDouble: 0.0, percentValue: 0.0, unit: "/ day", subtitleString: "Average daily spending limit, but you won't."),
        
        InfosDashBoard(title: "Today", modeIcon: ModeIcon.percentInv, valueDouble: 0.0, percentValue: 0.0, subtitleString: "How much you spent today."),
        InfosDashBoard(title: "Yesterday", modeIcon: ModeIcon.percentInv, valueDouble: 0.0, percentValue: 0.0, subtitleString: "How much you spent yesterday.")
    ]
    
    let dashBoardList: [TableViewDashBoard] = [
        TableViewDashBoard(title: "General Infos",
                           itens: [
                            DashboardItem.startBalance,
                            DashboardItem.actualBalance,
                            DashboardItem.averageGoal,
                            DashboardItem.spentSoFar]
                          ),
        TableViewDashBoard(title: "Chart Expenses",
                           itens: []),
        TableViewDashBoard(title: "Expenses Review",
                           itens: [
                            DashboardItem.averageSpent,
                            DashboardItem.averageLeftOver,
                            DashboardItem.today,
                            DashboardItem.yesterday]
                          )
    ]
    
    func infosDashBoard (index: Int) -> InfosDashBoard {
        return componentsList[index]
    }
    
    mutating func updateValuesDashboard() {
        for item in 0..<componentsListValues.count {
            componentsList[item].valueDouble = componentsListValues[item].0
            componentsList[item].percentValue = componentsListValues[item].1
        }
    }
}

// Define an enum CSV columns
enum CSVColumns: Int {
    case date = 0
    case category
    case title
    case amount
}

struct Month {
    let year: Int
    let monthInt: Int
    var dashBoard: Dashboard
    var purchases: [Purchase]
    var expensesPerDay: [String: Double]
    
    
    mutating func updateAllValues(){
        
        if self.dashBoard.componentsListValues[DashboardItem.startBalance.rawValue].0 > 0 {
            let value = self.dashBoard.componentsListValues[DashboardItem.startBalance.rawValue].0 - self.dashBoard.componentsListValues[DashboardItem.spentSoFar.rawValue].0
            
            self.changeValue(dashItem: DashboardItem.actualBalance, typeValue: .value, value: value)

        } else {
            self.changeValue(dashItem: DashboardItem.startBalance, typeValue: .value, value: 0)
            self.changeValue(dashItem: DashboardItem.actualBalance, typeValue: .value, value: 0)
        }
        
        
        self.changeValue(dashItem: DashboardItem.averageGoal, typeValue: .value, value: self.averageGoalCalc())
        self.changeValue(dashItem: DashboardItem.spentSoFar, typeValue: .value, value: -self.totalExpenses())
        self.changeValue(dashItem: DashboardItem.averageSpent, typeValue: .value, value: self.averageSpent())
        self.changeValue(dashItem: DashboardItem.averageLeftOver, typeValue: .value, value: self.averageLeftOver())
        self.changeValue(dashItem: DashboardItem.today, typeValue: .value, value: self.todayExpenses())
        self.changeValue(dashItem: DashboardItem.yesterday, typeValue: .value, value: self.yesterdayExpenses())
        
        self.dashBoard.updateValuesDashboard()

    }
    
    mutating func changeValue(dashItem: DashboardItem, typeValue: TypeValue, value: Double){
        
        switch typeValue {
        case .value:
            self.dashBoard.componentsListValues[dashItem.rawValue].0 = value
        case .percent:
            self.dashBoard.componentsListValues[dashItem.rawValue].1 = value
        }
    }
    
    func valueOf(dashItem: DashboardItem, typeValue: TypeValue) -> Double {
        switch typeValue {
        case .value:
            return self.dashBoard.componentsListValues[dashItem.rawValue].0
        case .percent:
            return self.dashBoard.componentsListValues[dashItem.rawValue].1
        }
    }
    
    func averageGoalCalc() -> Double{
        let valueCalc = valueOf(dashItem: .startBalance, typeValue: .value) / Double(self.totalDaysInMonth())
        return valueCalc
    }
    
    func averageSpent() -> Double{
        let valueCalc = self.totalExpenses() / Double(self.expensesPerDay.count)
        
        return valueCalc
    }
    
    func averageLeftOver() -> Double {
        let valueCalc = (valueOf(dashItem: .startBalance, typeValue: .value) - self.totalExpenses()) / Double(self.totalDaysInMonth() - self.expensesPerDay.count)
        
        return valueCalc
    }
        
    func todayExpenses() -> Double {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let currentDateString = dateFormatter.string(from: currentDate)
        
        return expensesPerDay[currentDateString] ?? 0.0
    }
    
    func yesterdayExpenses() -> Double {
        let currentDate = Date()
        let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate)!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let previousDateString = dateFormatter.string(from: previousDate)
        
        return expensesPerDay[previousDateString] ?? 0.0
    }
    
    mutating func addPurchase(_ purchase: Purchase) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: purchase.date)
        
        self.purchases.append(purchase)
        if let existingAmount = expensesPerDay[dateString] {
            expensesPerDay[dateString] = existingAmount + purchase.amount
        } else {
            expensesPerDay[dateString] = purchase.amount
        }
        
        self.updateAllValues()
    }
    
    func totalDaysInMonth() -> Int {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: year, month: monthInt)
        if let date = calendar.date(from: dateComponents) {
            return calendar.range(of: .day, in: .month, for: date)?.count ?? 0
        }
        return 0
    }
    
    func totalExpenses() -> Double {
        var totalExpensesCalc: Double = 0
        
        for expense in expensesPerDay {
            totalExpensesCalc += expense.value
        }

        return totalExpensesCalc
    }
    
    func averageExpensePerDay() -> Double {
        let days = totalDaysInMonth()
        
        return days == 0 ? 0 : totalExpenses() / Double(days)
    }
}

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
