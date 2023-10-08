//
//  Month.swift
//  helpWidgetUIKit
//
//  Created by Gustavo Diefenbach on 07/10/23.
//

import Foundation

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
        
        let valueAverageGoal = self.averageGoalCalc()
        self.changeValue(dashItem: DashboardItem.averageGoal, typeValue: .value, value: valueAverageGoal)
//        self.changeValue(dashItem: DashboardItem.averageGoal, typeValue: .percent, value: 0.0)

        self.changeValue(dashItem: DashboardItem.spentSoFar, typeValue: .value, value: -self.totalExpenses())
//        self.changeValue(dashItem: DashboardItem.spentSoFar, typeValue: .percent, value: -self.totalExpenses())

        let valueAverageSpent = self.averageSpent()
        self.changeValue(dashItem: DashboardItem.averageSpent, typeValue: .value, value: valueAverageSpent)
        self.changeValue(dashItem: DashboardItem.averageSpent, typeValue: .percent, value: self.percenteString(valueAverageSpent,valueAverageGoal))

        let valeuAverageLeftOver = self.averageLeftOver()
        self.changeValue(dashItem: DashboardItem.averageLeftOver, typeValue: .value, value: valeuAverageLeftOver)
        self.changeValue(dashItem: DashboardItem.averageLeftOver, typeValue: .percent, value: self.percenteString(valeuAverageLeftOver,valueAverageGoal))

        let valueToday = self.todayExpenses()
        self.changeValue(dashItem: DashboardItem.today, typeValue: .value, value: valueToday)
        self.changeValue(dashItem: DashboardItem.today, typeValue: .percent, value: self.percenteString(valueToday,valueAverageGoal))

        let valueYesterday = self.yesterdayExpenses()
        self.changeValue(dashItem: DashboardItem.yesterday, typeValue: .value, value: valueYesterday)
        self.changeValue(dashItem: DashboardItem.yesterday, typeValue: .percent, value: self.percenteString(valueYesterday,valueAverageGoal))
        
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
    
    func percenteString(_ valueOne: Double, _ valueTwo: Double) -> Double {
        let percentDecimal = ((valueOne/valueTwo) * 100)//.formatToFixedDecimalPlaces(2)
        return percentDecimal
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
