//
//  ContentView.swift
//  DarClock
//
//  Created by WorkSpace on 12/9/24.
//

import SwiftUI
import Foundation;


struct DateObj {
    var year: Int;
    var month: Int;
    var day: Int;
    var weekday: Int;
    var hour: Int;
    var minute: Int;
    var second: Int;
}
struct ContentView: View {
    @State private var currentTime = Date();
    let isChineseLang = (Locale.preferredLanguages.first ?? "zh").contains("zh")
    @State private var brightness: CGFloat = UIScreen.main.brightness
    
    
    var body: some View {
        let day = formate(currentTime);
        
        
        GeometryReader { geometry in
            let isPortrait = geometry.size.height > geometry.size.width;
            
            
            VStack(spacing: 30) {
                YearMonthDay(isChineseLang: false, dateState: (Year: day.year, Month: day.month, Day: day.day, Weekday: day.weekday))
                
                if isPortrait {
                    VStack(spacing: 30) {
                        ContainerView(value: day.hour)
                        ContainerView(value: day.minute)
                        ContainerView(value: day.second)
                    }
                    
                } else {
                    HStack(spacing: 30) {
                        ContainerView(value: day.hour)
                        ContainerView(value: day.minute)
                        ContainerView(value: day.second)
                    }
                    
                }
                
                
                Text("Less is More".uppercased())
            }
            .font(.largeTitle).bold()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .gesture(
                TapGesture(count: 2).onEnded {
                    print("double tap")
                }
            )
            
            .onAppear {
                startTimer()
            }
            
        }
    }
    
    
    private func formate(_ date: Date) -> DateObj {
        let currentYear = Calendar.current.component(.year, from: date)
        let currentMonth = Calendar.current.component(.month, from: date)
        let currentDay = Calendar.current.component(.day, from: date)
        let currentHour = Calendar.current.component(.hour, from: date)
        let currentMinute = Calendar.current.component(.minute, from: date)
        let currentSecond = Calendar.current.component(.second, from: date)
        let currentWeekday = Calendar.current.component(.weekday, from: date)
        
        return DateObj(year: currentYear, month: currentMonth, day: currentDay, weekday: currentWeekday, hour: currentHour, minute: currentMinute, second: currentSecond )
    }
    // 定时器更新时间
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            currentTime = Date()
        }
    }
    
}

struct ContainerView: View {
    var value: Int = 0
//    @State private var rotationAngle: Double = 0

    var body: some View {
        Text(value < 10 ? "0\(value)" : "\(value)")
            .font(.system(size: 75)).bold()
            .frame(width: 150, height: 150)
            .background(Color.white.opacity(0.1))
            .foregroundColor(Color(red: 243/255, green: 221/255.0, blue: 224/255.0))
            .cornerRadius(10)
//            .rotation3DEffect(
//                .degrees(rotationAngle),
//                axis: (x: 1, y: 0, z: 0)
//            )
//            .onAppear {
////                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
////                    withAnimation(.linear(duration: 0.2)) {
////                        rotationAngle = -90
////                    }
////                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////                       rotationAngle = 0
////                    }
////                }
//
//            }
    }
}




#Preview {
    ContentView()
}
