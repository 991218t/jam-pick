//
//  JamHomeView.swift
//  Jam_Pick
//
//  Created by 지구 on 4/13/25.
//

import SwiftUI

struct JamHomeView: View {
    @State private var jams: [Jam] = JamStorage.load()
    @State private var path: [Route] = []

    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .topTrailing) {
                
                // 배경
                Color.BackgroundColor.ignoresSafeArea()

                VStack {
                    Spacer().frame(height: 120)

                    // 랜덤 버튼
                    CustomJamButton(imageName: "Random")
                        .onTapGesture {
                            if let randomJam = jams.randomElement() {
                                path.append(.detail(randomJam))
                            }
                        }
                        .padding(.bottom, 10)
                    
                    // 글이 있을 때와 없을 때 조건 처리
                    if jams.isEmpty {
                        VStack {
                            Spacer()
                            Text("작성된 잼이 없어요 🍓")
                                .font(.bodyStyle)
                                .foregroundColor(.textLight)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    } else {
                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(jams) { jam in
                                    NavigationLink(value: Route.detail(jam)) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.white)
                                                .frame(height: 70)

                                            HStack {
                                                Text(jam.title)
                                                    .font(.bodyStyle)
                                                    .foregroundColor(.TextBold)
                                                    .padding(.leading, 20)
                                                Spacer()
                                            }
                                        }
                                        .padding(.vertical, 0)
                                    }
                                    .buttonStyle(PlainButtonStyle())

                                    Divider()
                                        .frame(height: 0.4)
                                        .background(Color.TextLight.opacity(0.05))
                                        .padding(.horizontal, 8)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .scrollContentBackground(.hidden)
                    }
                }

                // 중앙 타이틀 고정
                VStack {
                    Spacer().frame(height: 60)
                    HStack {
                        Spacer()
                        Image("MainTitle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 34)
                        Spacer()
                    }
                }

                // 우측 상단 + 버튼
                VStack {
                    Button(action: {
                        path.append(.typeSelect)
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.textBold)
                            .padding(.trailing, 8)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 16) // <- Safe area 겹침 방지
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .typeSelect:
                    JamTypeView { selectedCategory in
                        path.append(.write(selectedCategory))
                    }
                case .write(let category):
                    JamWriteView(jamType: category)
                case .detail(let jam):
                    JamDetailView(jam: jam)
                }
            }
            .onAppear {
                jams = JamStorage.load()
            }
        }
    }
}

#Preview {
    JamHomeView()
}
