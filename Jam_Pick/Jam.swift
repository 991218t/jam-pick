//
//  Jam.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import Foundation


struct Jam: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
    var date: Date
    var jamtype: JamType
}

enum JamType: String, CaseIterable, Codable {
    case honey = "개꿀잼"
    case chestnut = "밤잼"
    case strawberry = "딸기잼"
    case kiwi = "키위잼"
    
    // 각 잼 타입에 맞는 이미지 이름 반환
        var imageName: String {
            switch self {
            case .honey: return "jamHoney"
            case .strawberry: return "jamStrawberry"
            case .kiwi: return "jamKiwi"
            case .chestnut: return "jamChestnut"
            }
        }
        
        // 아이콘을 반환하는 computed property
        var icon: String {
            switch self {
            case .honey:
                return "jamHoney" // honey 아이콘 이미지 이름
            case .strawberry:
                return "jamStrawberry" // strawberry 아이콘 이미지 이름
            case .chestnut:
                return "jamChestnut" // chestnut 아이콘 이미지 이름
            case .kiwi:
                return "jamKiwi" // kiwi 아이콘 이미지 이름
            }
        }
    }


let sampleJams: [Jam] = [
    Jam(title: "코로 미역국 먹었던 날", content: "유치원생때 튀고 싶어서 코로 미역국 먹어 봤어..", date: Date(), jamtype: .honey),
    Jam(title: "보타가 깨워줘도 못일어난 날", content: "나는 잠귀가 어두워", date: Date(), jamtype: .strawberry),
    Jam(title: "사람은 죽으면 어디로 갈까?", content: "사후세계 너무너무너무 무서워!! ㅠㅠ", date: Date(), jamtype: .chestnut)
]

