//
//  JamWriteView.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//
import SwiftUI

extension JamType {
    var category: JamCategory {
        switch self {
        case .honey: return .honey
        case .strawberry: return .strawberry
        case .kiwi: return .kiwi
        case .chestnut: return .chestnut
        }
    }

    var imageName: String {
        return category.imageName
    }

    var color: Color {
        return category.color
    }
}

struct JamWriteView: View {
    let jamType: JamType
    
    @EnvironmentObject var navigationModel: NavigationModel
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var content: String = ""
    @FocusState private var isTitleFocused: Bool
    @FocusState private var isContentFocused: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Image(jamType.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 37, height: 45)

                ZStack(alignment: .center) {
                    if title.isEmpty && !isTitleFocused {
                        Text("잼얘 제목을 입력해주세요")
                            .jamTitleStyle()
                    }
                    
                    TextField("", text: $title)
                        .jamTitleStyle()
                        .focused($isTitleFocused)
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.center)
                        .tint(jamType.color)
                        .padding(.vertical, 10)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 10)

                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.BackgroundAccent)
                    
                    TextEditor(text: $content)
                        .font(.jamBody)
                        .foregroundColor(.textNormal)
                        .padding(20)
                        .background(Color.clear)
                        .focused($isContentFocused)
                        .tint(jamType.color)
                    
                    if content.isEmpty && !isContentFocused {
                        Text("잼얘의 내용을 입력해주세요!")
                            .font(.jamBody)
                            .foregroundColor(.textNormal)
                            .tracking(-0.5)
                            .lineSpacing(6)
                            .padding(20)
                    }
                }
                .frame(width: 345, height: 404)
                .cornerRadius(10)
                .clipped()
                .shadow(color: Color("Shadow").opacity(0.4), radius: 20)
                .padding(.top, 20)
                
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 30)
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let newJam = Jam(id: UUID(), title: title, content: content, date: Date(), jamtype: jamType)
                        JamStorage.save(jam: newJam)
                        navigationModel.path = []
                        dismiss() // 저장 후 홈으로 돌아가기
                    }) {
                        Image(systemName: "checkmark")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.textBold)
                            .padding(.trailing, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    JamWriteView(jamType: .honey)
        .environmentObject(NavigationModel())
}
