//
//  JamTypeView.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//


import SwiftUI

enum JamCategory: String, CaseIterable {
    case honey = "꿀잼"
    case strawberry = "딸기잼"
    case chestnut = "밤잼"
    case kiwi = "키위잼"
    
    var description: String {
        switch self {
        case .honey:
            return "나만 아는 레전드 꿀잼!"
        case .strawberry:
            return "최근 겪은 신선한 잼얘"
        case .chestnut:
            return "나 말고 친구가 겪은 잼얘"
        case .kiwi:
            return "가끔 진대도 나누고 싶어.."
        }
    }
    
    var color: Color {
        switch self {
        case .honey:
            return .JamHoney // 색깔 지정
        case .strawberry:
            return .JamStrawberry
        case .chestnut:
            return .JamChestnut
        case .kiwi:
            return .JamKiwi
        }
    }
    
    // 아이콘 설정
    var imageName: String {
        switch self {
        case .honey:
            return "jamHoney" // 꿀잼 이미지 이름
        case .strawberry:
            return "jamStrawberry" // 딸기잼
        case .chestnut:
            return "jamChestnut" // 밤잼
        case .kiwi:
            return "jamKiwi" // 키위잼
        }
    }
    
    // 타이틀 이미지 추가
    var titleImageName : String {
        switch self {
        case .honey:
            return "Honey"
        case .strawberry:
            return "Strawberry"
        case .chestnut:
            return "Chestnut"
        case .kiwi:
            return "Kiwi"
        }
    }
}

struct JamTypeView: View {
    @State private var selectedJamType: JamCategory? = nil // 선택된 잼 타입을 저장할 변수

    // 잼 종류 2열
    let rows: [[JamCategory]] = [
        [.honey, .strawberry],
        [.kiwi, .chestnut]
    ]
    
    var body: some View {
        VStack (spacing: 32) {
            HStack {
                Image("JamType")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 73)
                    .padding(.top, 80) //위치조정용 (Y축)
                    .padding(.leading, 30)
                Spacer()
            }
            // 2열 그리드
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 7), GridItem(.flexible(), spacing: 7)
                ],
                spacing: 9 // 버튼끼리 행 간격!!!!!
            ) {
                ForEach(JamCategory.allCases, id: \.self) { type in
                    
                    //버튼 버틍 버튼 !!
                    Button(action: {
                        // 선택한 잼 타입 저장, 다음 화면으로 이동 예정 !!!!
                    }) {
                        VStack(spacing: 10) {
                            Spacer().frame(height: 29)
                            
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 73)
                            
                            // 잼 이름 표시
                            Image(type.titleImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            
                            // 잼 설명 추가
                            Text(type.description)
                                .font(.typeBody)
                                .foregroundColor(.textNormal)
                                .tracking(-0.5)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 8)
                            
                            Spacer().frame(height: 20)
                        }
                        .frame(maxWidth: .infinity, minHeight: 120)
                        .background(Color.BackgroundButton)
                        .cornerRadius(20)
                    }
                }
            }
            .padding() // 그리드 전체 여백

            Spacer() // 하단 여백
        }
        .padding(.horizontal)
        .navigationTitle("잼 종류 선택")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(false)
        .background(Color.BackgroundColor.ignoresSafeArea())
    }
}

#Preview {
    JamTypeView()
}
