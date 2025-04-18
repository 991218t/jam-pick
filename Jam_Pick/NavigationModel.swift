//
//  NavigationModel.swift
//  Jam_Pick
//
//  Created by 지구 on 4/18/25.
//

import SwiftUI

// path 관리
class NavigationModel: ObservableObject {
    @Published var path: [Route] = []
}

enum Route: Hashable {
    case typeSelect
    case write(JamType)
    case detail(Jam)
}

