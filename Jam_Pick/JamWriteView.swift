//
//  JamWriteView.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

struct JamWriteView: View {
    let jamType: JamType // 선택된 잼 타입 전달 -
    
    @State private var title: String = ""
    @State private var content: String = ""
    
    @FocusState private var isTitleFocused: Bool
    @FocusState private var isContentFocused: Bool
    
    var body: some View {
        VStack {
            VStack(spacing:0) {
                // 아이콘
                Image(jamType.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 37, height: 45)

                
                // 제목입력창
                ZStack(alignment: .center) {
                    if title.isEmpty && !isTitleFocused {
                        Text("잼얘 제목을 입력해주세요")
                            .jamTitleStyle()
                    }
        
                    TextField("", text: $title)
                        .jamTitleStyle()
                        .focused($isTitleFocused)
                        .padding(.vertical, 10)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding(.top, 10)
                .frame(maxWidth: .infinity, alignment: .center)
                
                // 본문 입력 (내용 박스!)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.BackgroundAccent)
                    
                    TextEditor(text: $content)
                        .font(.jamBody)
                        .foregroundColor(.textNormal)
                        .padding(20) // 안쪽 여백
                        .background(Color.clear)
                        .focused($isContentFocused)
                        .tint(Color.JamHoney)
                    
                    if content.isEmpty && !isContentFocused {
                        Text("잼얘의 내용을 입력해주세요!")
                            .foregroundColor(.textNormal)
                            .font(.jamBody)
                            .padding(20)
                        
                    }
                }
                .cornerRadius(10)
                .clipped()
                .padding(.top,20)
                .frame(maxWidth: .infinity, maxHeight: 404 ,alignment: .center)
            }
            .frame(maxHeight: .infinity,alignment: .top)
            .padding(.top, 84)
          
    //        .navigationBarTitleDisplayMode(.inline)
    //        .navigationBarItems(
    //            leading: Button(action: {
    //                // 뒤로가기~
    //            }) {
    //                Image(systemName: "arrow.left.circle.fill")
    //                    .font(.title)
    //            },
    //            trailing: Button(action: {
    //                // 저장 !!
    //            }) {
    //                Text("저장")
    //                    .fontWeight(.bold)
    //            }
    //        )
        }
        .padding([.leading, .trailing], 24)
        .background(Color.BackgroundColor)
    }
}

#Preview {
    JamWriteView(jamType: .honey)
}
