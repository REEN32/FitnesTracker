struct HomeView: View {
    @State var progressValue: Int = 0
    var body: some View {
        ZStack {
            Color.mainBackground
                .edgesIgnoringSafeArea(.all)
            GeometryReader { mainProxy in
                VStack {
                    HStack {    // первый (верхний) блок
                        VStack {
                            RingProgressWithCounter(progress: progressValue, maxValue: 100, color: Color.selectedPurpleColor, lineWidth: 12)
                            Text("Daily Push-Ups")
                                .padding(.top, 3)
                                .font(Font.system(size: 20, weight: .bold))
                                .foregroundStyle(Color.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("Тут будет график")
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .mainBorder()
                    
                    VStack {    // Второй блок
                        HStack {
                            Text("Quick Add")
                                .padding(5)
                                .font(Font.system(size: 18, weight: .bold))
                                .foregroundStyle(Color.selectedPurpleColor)
                            Spacer()
                        }
                        GeometryReader { proxy in
                            let totalWidth = proxy.size.width
                            let totalHeight = proxy.size.height
                            let spacingWidth: CGFloat = 8
                            let totalSpacingWidth = spacingWidth * 4
                            let availableWidth = totalWidth - totalSpacingWidth
                            HStack(spacing: spacingWidth) {
                                ButtonQuickAdd(text: "1",
                                               backgroundColor: Color.selectedPurpleColor,
                                               textColor: Color.mainBackground,
                                               width: availableWidth * 0.14,
                                               height: totalHeight * 0.8
                                ) {
                                    progressValue += 1
                                }
                                ButtonQuickAdd(text: "5",
                                               width:availableWidth * 0.14,
                                               height: totalHeight * 0.8) {
                                    progressValue += 5
                                }
                                ButtonQuickAdd(text: "10",
                                               width:availableWidth * 0.14,
                                               height: totalHeight * 0.8) {
                                    progressValue += 10
                                }
                                ButtonQuickAdd(text: "Custom",
                                               width:availableWidth * 0.28,
                                               height: totalHeight * 0.8) {
                                    
                                }
                                ButtonQuickAdd(text: "Set Goal",
                                               backgroundColor: Color.selectedPurpleColor,
                                               textColor: Color.mainBackground,
                                               width:availableWidth * 0.30,
                                               height: totalHeight * 0.8) {
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                        .frame(height: mainProxy.size.width * 0.1)
                    }
                    .padding(.vertical, 15)
                    .padding(.horizontal, 10)
                    .mainBorder()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
