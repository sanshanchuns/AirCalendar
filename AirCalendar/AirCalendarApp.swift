//
//  AirCalendarApp.swift
//  AirCalendar
//
//  Created by leo on 2025/2/8.
//

import SwiftUI

@main
struct AirCalendarApp: App {
    var body: some Scene {
        WindowGroup {
//            AppIconGenerator()
            ContentView()
        }
    }
}

//struct AppIconGenerator: View {
//    var body: some View {
//        ZStack {
//            // 背景
//            LinearGradient(
//                gradient: Gradient(colors: [
//                    Color(red: 0.4, green: 0.6, blue: 1.0),
//                    Color(red: 0.3, green: 0.5, blue: 0.9)
//                ]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            
//            // 日历图标
//            VStack(spacing: 0) {
//                // 日历顶部
//                RoundedRectangle(cornerRadius: 8)
//                    .fill(Color.white)
//                    .frame(width: 70, height: 20)
//                    .overlay(
//                        HStack(spacing: 12) {
//                            Circle()
//                                .fill(Color.gray.opacity(0.5))
//                                .frame(width: 6, height: 6)
//                            Circle()
//                                .fill(Color.gray.opacity(0.5))
//                                .frame(width: 6, height: 6)
//                        }
//                    )
//                
//                // 日历主体
//                RoundedRectangle(cornerRadius: 12)
//                    .fill(Color.white)
//                    .frame(width: 80, height: 80)
//                    .overlay(
//                        Text("31")
//                            .font(.system(size: 40, weight: .bold))
//                            .foregroundColor(.black)
//                    )
//            }
//            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
//        }
//        .frame(width: 1024, height: 1024)
//    }
//}
//
//#Preview {
//    AppIconGenerator()
//}
