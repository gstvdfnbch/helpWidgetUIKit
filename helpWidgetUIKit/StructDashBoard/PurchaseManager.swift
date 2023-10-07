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
    var startBalance: Double = 0
    var actualBalance: Double = 0
    var averageGoal: Double = 0
    var spentSoFar: Double = 0
    var averageSpent: Double = 0
    var averageLeftOver: Double = 0
    var today: Double = 0
    var yesterday: Double = 0
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
        
        if self.dashBoard.startBalance > 0 {
            self.dashBoard.actualBalance = self.dashBoard.startBalance - self.dashBoard.spentSoFar
        } else {
            self.dashBoard.startBalance = 0
            self.dashBoard.actualBalance = 0
        }
        
        self.dashBoard.averageGoal = self.averageGoalCalc()
        self.dashBoard.spentSoFar = self.totalExpenses()
        self.dashBoard.averageSpent = self.averageSpent()
        self.dashBoard.averageLeftOver = self.averageLeftOver()
        self.dashBoard.today = self.todayExpenses()
        self.dashBoard.yesterday = self.yesterdayExpenses()
    }
    
    func averageGoalCalc() -> Double{
        let valueCalc = self.dashBoard.startBalance / Double(self.totalDaysInMonth())
        return valueCalc
    }
    
    func averageSpent() -> Double{
        let valueCalc = self.totalExpenses() / Double(self.expensesPerDay.count)
        
        return valueCalc
    }
    
    func averageLeftOver() -> Double {
        let valueCalc = (self.dashBoard.startBalance - self.totalExpenses()) / Double(self.totalDaysInMonth() - self.expensesPerDay.count)
        
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
        
        print("Quantidade de Meses \(months.count)")
        print("startBalance: \(self.months.last?.dashBoard.startBalance)")
        print("actualBalance: \(self.months.last?.dashBoard.actualBalance)")
        print("averageGoal: \(self.months.last?.dashBoard.averageGoal)")
        print("spendSoFar: \(self.months.last?.dashBoard.spentSoFar)")
        print("averageSpent: \(self.months.last?.dashBoard.averageSpent)")
        print("averageLeftOver: \(self.months.last?.dashBoard.averageLeftOver)")
        print("today: \(self.months.last?.dashBoard.today)")
        print("yesterday: \(self.months.last?.dashBoard.yesterday)")
        
        for month in months {
            print("Compras \(month.monthInt):  \(month.averageExpensePerDay())")
        }
    }
}
