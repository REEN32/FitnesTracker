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
                            let spacing: CGFloat = 8
                            let totalSpacing = spacing * 4
                            let availableWidth = totalWidth - totalSpacing
                            HStack(spacing: spacing) {
                                ButtonQuickAdd(text: "1",
                                               backgroundColor: Color.selectedPurpleColor,
                                               textColor: Color.mainBackground,
                                               width: availableWidth * 0.14
                                ) {
                                    progressValue += 1
                                }
                                ButtonQuickAdd(text: "5",
                                               width:availableWidth * 0.14) {
                                    progressValue += 5
                                }
                                ButtonQuickAdd(text: "10",
                                               width:availableWidth * 0.14) {
                                    progressValue += 10
                                }
                                ButtonQuickAdd(text: "Custom",
                                               width:availableWidth * 0.28) {
                                    
                                }
                                ButtonQuickAdd(text: "Set Goal",
                                               backgroundColor: Color.selectedPurpleColor,
                                               textColor: Color.mainBackground,
                                               width:availableWidth * 0.30) {
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
