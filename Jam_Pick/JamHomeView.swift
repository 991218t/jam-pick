//
//  JamHomeView.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

struct JamHomeView: View {
    @State private var jams: [Jam] = sampleJams
    @State private var randomJam: Jam? = nil
    @State private var showWriteView = false // 나중에 네비게이션 링크로!
    
    var body: some View {
        NavigationView {
            VStack {
                // 랜덤 잼 푸기 버튼
                Button(action: {
                    if !jams.isEmpty {
                        randomJam = jams.randomElement()
                    }
                }) {
                    Image("Random")
                        .resizable()
                        .scaledToFit()
                        .frame(height : 30)
                        .background(Color.jamStrawberry.opacity(0.3)) //일단 딸기색 활용
                        .padding(.horizontal)
                        .cornerRadius(100)
                }
                .padding(.top)
                
                // 랜덤 잼이 있을 경우 표시
                if let jam = randomJam {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(jam.title)
                            .font(.bodyStyle)
                            .foregroundColor(.textBold)
                            .bold()
                        Text(jam.content)
                            .font(.bodyStyle)
                            .foregroundColor(.textBold)
                            .lineLimit(2)
                    }
                    .padding()
                    .background(Color.backgroundAccent)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }

                // 잼 리스트
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(jams) { jam in
                            NavigationLink(destination: JamDetailView(jam: jam)) {
                                Text(jam.title)
                                    .font(.bodyStyle)
                                    .foregroundColor(.textBold)
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white) // 필요시 배경 추가
                            }
                            .buttonStyle(PlainButtonStyle()) // 완전한 클릭 스타일로 변경
                            Divider() // 구분선 (선택사항)
                        }
                    }
                    .padding(.horizontal)
                }

                    
                .scrollContentBackground(.hidden) // 리스트 배경 제거
                .background(Color.BackgroundColor) // 전체 배경 통일
                
            }
            .background(Color.BackgroundColor.ignoresSafeArea())
            .toolbar {
                            ToolbarItem(placement: .principal) {
                                Image("HomeTitle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 34)
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    showWriteView = true
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.textBold)
                                }
                            }
                        }
                    }
                }
            }
        #Preview {
        JamHomeView()
        }
