struct HomeView: View {
    @State var progressValue: Int = 0
    @State var maxProgress: Int = 100
    @State var showAddWindow: Bool = false
    @State var showSetGoalView: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mainBackground
                    .edgesIgnoringSafeArea(.all)
                GeometryReader { mainProxy in
                    VStack {
                        HStack {    // 1 блок
                            VStack {
                                RingProgressWithCounter(progress: progressValue, maxValue: maxProgress, color: Color.selectedPurpleColor, lineWidth: 12, width: mainProxy.size.width * 0.45, height: mainProxy.size.height * 0.2, fontSize: maxProgress < 1000 || progressValue < 1000 || mainProxy.size.width > 768 ? 28 : 22)
                                Text("Daily Push-Ups")
                                    .padding(.top, 3)
                                    .mainTextStyle()
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
                        
                        VStack {    // 2 блок
                            HStack {
                                Text("Quick Add")
                                    .padding(5)
                                    .mainTextStyle(size: 18)
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
                                        CountFormatter.addCount(to: &progressValue, what: "1")
                                    }
                                    ButtonQuickAdd(text: "5",
                                                   width:availableWidth * 0.14,
                                                   height: totalHeight * 0.8) {
                                        CountFormatter.addCount(to: &progressValue, what: "5")
                                    }
                                    ButtonQuickAdd(text: "10",
                                                   width:availableWidth * 0.14,
                                                   height: totalHeight * 0.8) {
                                        print(mainProxy.size)
                                        CountFormatter.addCount(to: &progressValue, what: "10")
                                    }
                                    ButtonQuickAdd(text: "Custom",
                                                   width:availableWidth * 0.28,
                                                   height: totalHeight * 0.8) {
                                        showAddWindow.toggle()
                                    }
                                                   .navigationDestination(isPresented: $showAddWindow) {
                                                       CustomProgressAddScreen(showScreen: $showAddWindow,
                                                       progress: $progressValue)
                                                   }
                                    ButtonQuickAdd(text: "Set Goal",
                                                   backgroundColor: Color.selectedPurpleColor,
                                                   textColor: Color.mainBackground,
                                                   width:availableWidth * 0.30,
                                                   height: totalHeight * 0.8) {
                                        showSetGoalView.toggle()
                                    }
                                                   .navigationDestination(isPresented: $showSetGoalView) {
                                                       SetGoalScreen(showSetGoalView: $showSetGoalView,
                                                       maxProgress: $maxProgress)
                                                   }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            }
                            .frame(height: mainProxy.size.width * 0.1)
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 10)
                        .mainBorder()
                        HStack {
                            VStack(alignment: .leading) {  // 3 блок
                                HStack {
                                    Text("Progress")
                                        .mainTextStyle(size: 18)
                                    Spacer()
                                }
                                Spacer()
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text("Current Streak:")
                                            .mainTextStyle(color: Color.selectedPurpleColor.opacity(0.7),
                                                           size: 15)
                                        Text("0 days")
                                            .mainTextStyle()
                                    }
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Longest Streak:")
                                        .mainTextStyle(color: Color.selectedPurpleColor.opacity(0.7),
                                                       size: 15)
                                    Text("0 days")
                                        .mainTextStyle()
                                }
                            }
                            .padding(15)
                            .frame(width: mainProxy.size.width * 0.45,
                                   height: mainProxy.size.height * 0.23)
                            .mainBorder(paddingH: 4)
                            VStack(alignment: .leading) {   // 4 блок
                                HStack {
                                    Text("Achievemts")
                                        .mainTextStyle(size: 18)
                                    Spacer()
                                }
                                VStack {
                                    ButtonAchivement(text: "First Step",
                                                     backgroundColor: Color.goldenBackground,
                                                     textColor: .selectedPurpleColor,
                                                     width: mainProxy.size.width * 0.35,
                                                     height: mainProxy.size.height * 0.035,
                                                     progress: 50,
                                                     maxValue: 100) {
                                    }
                                                     .padding(.vertical, 2)
                                    ButtonAchivement(text: "First Step",
                                                     backgroundColor: Color.gray,
                                                     textColor: .selectedPurpleColor,
                                                     width: mainProxy.size.width * 0.35,
                                                     height: mainProxy.size.height * 0.035,
                                                     progress: 50,
                                                     maxValue: 100) {
                                    }
                                                     .padding(.vertical, 2)
                                    ButtonAchivement(text: "First Step",
                                                     backgroundColor: Color.goldenBackground,
                                                     textColor: .selectedPurpleColor,
                                                     width: mainProxy.size.width * 0.35,
                                                     height: mainProxy.size.height * 0.035,
                                                     progress: 100,
                                                     maxValue: 100) {
                                    }
                                                     .padding(.vertical, 2)
                                }
//                                Spacer()
                            }
                            .padding(15)
                            .frame(width: mainProxy.size.width * 0.45,
                                   height: mainProxy.size.height * 0.23)
                            .mainBorder(paddingH: 4)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
