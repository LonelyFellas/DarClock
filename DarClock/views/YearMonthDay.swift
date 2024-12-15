//
//  YearMonthDay.swift
//  DarClock
//
//  Created by WorkSpace on 12/14/24.
//

// 重新添加类型定义
typealias IDateState = (Year: Int, Month: Int, Day: Int, Weekday: Int)

import SwiftUI

struct YearMonthDay: View {
    let isChineseLang: Bool
    let dateState: IDateState
    
    
    init(isChineseLang: Bool = false, dateState: IDateState? = nil) {
        self.isChineseLang = isChineseLang
        self.dateState = dateState ?? (Year: 2024, Month: 12, Day: 14, Weekday: 1)
    }
    
    private var getMonth: String {
        let enMonth: [String] = ["Jan", "Feb", "Mar", "Apr", "May",  "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        return isChineseLang ? "\(dateState.Month)月" : enMonth[dateState.Month - 1]
    }
    
    private var getDay: String {
        return "\(dateState.Day)\(isChineseLang ? "日" : "")"
    }
    
    
    private var getWeekDay: String {
        let enWeekday: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        let zhWeekday: [String] = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
        let index = (dateState.Weekday - 1) % 7 
        return isChineseLang ? zhWeekday[index] : enWeekday[index]
    }
    
    private var getValue:  String {
        let year = String(dateState.Year)
        let month = getMonth;
        let day = getDay;
        let weekDay = getWeekDay;
        return isChineseLang ? "\(year) \(month) \(day) \(weekDay)" : "\(month) \(day), \(year) \(weekDay)"
    }
    
    var body: some View {
        Text("\(getValue)")
    }
}

#Preview {
    YearMonthDay(isChineseLang: false)
}
