//
//  JamDetailView.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

struct JamDetailView: View {
    @Environment(\.dismiss) var dismiss
    let jam: Jam
    
    var body: some View {
            VStack(spacing: 0) {
                // 잼 아이콘....
                Image(jam.jamtype.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 37, height: 45)
                
                // 제목
                Text(jam.title)
                    .jamTitleStyle()
                    .padding(.vertical, 10)
                    .padding(.top, 10)
                
                // 내용
                VStack(alignment: .leading) {
                    Text(jam.content)
                        .font(.jamBody)
                        .foregroundColor(.textNormal)
                        .tracking(-0.5)
                        .lineSpacing(6)
                        .multilineTextAlignment(.leading)
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .leading) // 텍스트 좌측 정렬 유지
                }
                .frame(width: 360, height: 404, alignment: .top) // ✅ 고정 높이 + 상단 정렬
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.BackgroundAccent)
                )
                .cornerRadius(10)
                .clipped()
                .shadow(color: Color("Shadow").opacity(0.4), radius: 20)
                .padding(.top, 20)



                // 글 작성 날짜
                HStack{
                    Spacer()
                    Text("\(jam.date, formatter: dateFormatter)")
                        .font(.jamBody)
                        .tracking(-1.0)
                        .foregroundColor(.textLight)
                }
                .padding(.top, 20)
                .padding(.bottom,5)
                
                // 수정 & 삭제 버튼
                HStack(spacing : 12){
                    Spacer()
                    Button(action: {
                        print("수정 버튼 클릭")
                    }) {
                        Text("수정")
                            .font(.jamBody)
                            .foregroundColor(.textLight)
                            .tracking(1.0)
                    }
                    .buttonStyle(.plain) // 버튼 스타일 제거
                    
                    Text("|")
                        .font(.jamBody)
                        .foregroundColor(.textLight)
                    
                    Button(action: {
                        print("삭제 버튼 클릭")
                    }) {
                        Text("삭제")
                            .font(.jamBody)
                            .foregroundColor(.textLight)
                            .tracking(1.0)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxHeight: .infinity,alignment: .top)
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
            }
            .background(Color.BackgroundColor)
        }
        }
        // 날짜 포맷터 아니 근데 바꿀거임
        private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "ko_KR") // 한국어로 설정
            formatter.dateFormat = "yy년 M월 dd일"
            return formatter
        }

    #Preview {
        JamDetailView(jam: sampleJams[0])  // 첫 번째 샘플 데이터를 전달
    }
