//
//  DarClockApp.swift
//  DarClock
//
//  Created by WorkSpace on 12/9/24.
//

import SwiftUI

@main
struct DarClockApp: App {
    @State private var showSplash = true
    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView(showSplash: $showSplash)
            } else {
                ContentView()
            }
        }
    }
}

struct SplashView: View {
    @State private var fadeOut = false
    @Binding var showSplash: Bool
    
    var body: some View {
        ZStack {
            Color.black // 背景色
                .ignoresSafeArea()
            
            Image(systemName: "applelogo") // 开机图标
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
                .opacity(fadeOut ? 0 : 1) // 动态控制透明度
                .scaleEffect(fadeOut ? 1.5 : 1) // 放大动画
                .animation(.easeOut(duration: 1.5), value: fadeOut)
        }
        .onAppear {
            // 延迟 2 秒后隐藏动画
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                fadeOut = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showSplash = false // 切换到主界面
                    }
                }
            }
        }
    }
}
