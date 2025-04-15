//
//  DesignSystem.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

extension Color {
    // 배경 색상
    static let BackgroundColor = Color("BackgroundColor") // 기본 배경
    static let BackgroundAccent = Color("BackgroundAccent") // 텍스트박스 배경
    static let BackgroundButton = Color("BackgroundButton") // 버튼박스 배경
    
    // 텍스트 색상
    static let TextBold = Color("TextBold") // 기본 텍스트 색상
    static let TextNormal = Color("TextNormal") // 보조 텍스트 색상
    static let TextLight = Color("TextLight") // 강조 텍스트 색상

    // 잼 카테고리 색상
    static let JamHoney = Color("JamHoney") // 꿀잼 색상
    static let JamChestnut = Color("JamChestnut") // 밤잼 색상
    static let JamStrawberry = Color("JamStrawberry") // 딸기잼 색상
    static let JamKiwi = Color("JamKiwi") // 키위잼 색상
}

    // 폰트 스타일 저장
extension Font {
    static let jamTitle = Font.custom("Ownglyph_smartiam-Rg", size: 36) // 잼 제목
    static let typeBody = Font.custom("Ownglyph_smartiam-Rg", size: 18) // 타입 내용
    static let jamBody = Font.custom("Ownglyph_smartiam-Rg", size: 24) //잼 내용
    static let bodyStyle = Font.custom("Ownglyph_smartiam-Rg", size: 22) // 리스트에서 제목
}

    // Extension 폰트 스타일
extension View {
    func jamTitleStyle() -> some View {
        self
            .font(.jamTitle)
            .foregroundColor(.TextBold)
            .tracking(-0.5) // 자간 0.5
            .lineSpacing(6) // 행간 6
            .multilineTextAlignment(.center) // 가운데 정렬
    }
}
