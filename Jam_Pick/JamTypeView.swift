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
    case kiwi = "키위잼"
    case chestnut = "밤잼"
    
    var description: String {
        switch self {
        case .honey:
            return "나만 아는 레전드 꿀잼!"
        case .strawberry:
            return "최근 겪은 신선한 잼얘"
        case .kiwi:
            return "나 말고 친구가 겪은 잼얘"
        case .chestnut:
            return "가끔 진대도 나누고 싶어.."
        }
    }
    
    var color: Color {
        switch self {
        case .honey:
            return .JamHoney // 색깔 지정
        case .strawberry:
            return .JamStrawberry
        case .kiwi:
            return .JamKiwi
        case .chestnut:
            return .JamChestnut
        }
    }
    
    // 아이콘 설정
    var imageName: String {
        switch self {
        case .honey:
            return "jamHoney" // 꿀잼 이미지 이름
        case .strawberry:
            return "jamStrawberry" // 딸기잼
        case .kiwi:
            return "jamKiwi" // 키위잼
        case .chestnut:
            return "jamChestnut" // 밤잼
        }
    }
    
    // 타이틀 이미지 추가
    var titleImageName : String {
        switch self {
        case .honey:
            return "Honey"
        case .strawberry:
            return "Strawberry"
        case .kiwi:
            return "Kiwi"
        case .chestnut:
            return "Chestnut"
        }
    }
}

extension JamCategory {
    var toJamType: JamType {
        switch self {
        case .honey: return .honey
        case .strawberry: return .strawberry
        case .kiwi: return .kiwi
        case .chestnut: return .chestnut
        }
    }
}

struct JamTypeView: View {
    let onTypeSelected: (JamType) -> Void
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image("JamType")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 73)
                    .padding(.top, 45)
                    .padding(.leading, 30)
                Spacer()
            }
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 7),
                    GridItem(.flexible(), spacing: 7)
                ],
                spacing: 9
            ) {
                ForEach(JamCategory.allCases, id: \.self) { type in
                    Button(action: {
                        onTypeSelected(type.toJamType) //
                    }) {
                        VStack(spacing: 10) {
                            Spacer().frame(height: 29)

                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 73)

                            Image(type.titleImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)

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
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Shadow").opacity(0.5), lineWidth: 1)
                        )
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 30)
                    }
                }
            }
            .padding()

            Spacer()
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .background(Color.BackgroundColor.ignoresSafeArea())
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action : {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.textBold)
                        .padding(.leading, 8)
                }
            }
        }
    }
}

#Preview {
    JamTypeView(onTypeSelected: { _ in})
}
