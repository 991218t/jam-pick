//
//  JamDetailView.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

struct JamDetailView: View {
    var jam: Jam
    var body: some View {
            VStack(spacing: 0) {
                // 잼 아이콘....
                Image(jam.jamtype.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 37, height: 45)
                
                // 제목
                ZStack {
                    Text("잼얘 제목이 표시됩니다")
                        .jamTitleStyle()
                        .padding(.vertical, 10)
                        .padding(.top, 10)
                }
                
                // 내용
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.BackgroundAccent)
                    
                    Text("여기에 잼의 내용이 표시됩니다.")
                        .font(.jamBody)
                        .tracking(-0.5)
                        .lineSpacing(6)
                        .foregroundColor(.textNormal)
                        .padding(20)
                }
                .cornerRadius(10)
                .clipped()
                .padding(.top,20)
                .frame(maxWidth: .infinity, maxHeight: 404 ,alignment: .center)

                // 글 작성 날짜
                Text("\(jam.date, formatter: dateFormatter)")
                    .font(.jamBody)
                    .tracking(-0.5)
                    .foregroundColor(.textLight)
                    .padding(.top, 10)
                
                // 수정 & 삭제 버튼
                HStack {
                    Button(action: {
                        print("수정 버튼 클릭")
                    }) {
                        Text("수정")
                            .font(.jamBody)
                            .foregroundColor(.textLight)
                    }
                    .buttonStyle(.plain) // 버튼 스타일 제거

                    Button(action: {
                        print("삭제 버튼 클릭")
                    }) {
                        Text("삭제")
                            .font(.jamBody)
                            .foregroundColor(.textLight)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxHeight: .infinity,alignment: .top)
            .padding(.top, 84)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)  // 뒤로가기 버튼 자동으로 표시 .. 아마 되는 거 맞음
            .background(Color.BackgroundColor)
        }
        }
        // 날짜 포맷터 아니 근데 바꿀거임
        private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
        }

    #Preview {
        JamDetailView(jam: sampleJams[0])  // 첫 번째 샘플 데이터를 전달
    }
