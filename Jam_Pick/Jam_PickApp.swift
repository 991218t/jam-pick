//
//  Jam_PickApp.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

@main
struct JamPickApp: App {
    @StateObject var navigationModel = NavigationModel() // NavigationModel 객체 생성

    var body: some Scene {
        WindowGroup {
            JamHomeView()
                .environmentObject(navigationModel) // 환경 객체로 주입
        }
    }
}

