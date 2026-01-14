struct HomeView: View {
    @State var progressValue: Int = 0
    @State var maxProgress: Int = 100
    @State var showAddWindow: Bool = false
    @State var showSetGoalView: Bool = false
    @State var showTrainingView: Bool = false
    @State var selectedScreen: NavigationItem? = NavigationItem(title: "Main", icon: "house.fill", view: .main)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mainBackground
                    .edgesIgnoringSafeArea(.all)
                GeometryReader { mainProxy in
                    let paddingH = mainProxy.size.width * 0.02
                    let paddingV = mainProxy.size.height * 0.0038
                    VStack {
                        if let selectedScreen = selectedScreen {
                            switch selectedScreen.view {
                            case .main:
                                mainContentView(mainProxy: mainProxy, paddingH: paddingH, paddingV: paddingV)
                            case .profile:
                                TrainingView()
                            case .stats:
                                StatsView(monday: progressValue)
                            }
                        }
                        Spacer()
                        ScreenPickerView(selected: $selectedScreen, item:
                                            [NavigationItem(title: "Stats", icon: "chart.bar.fill", view: .stats),
                                             NavigationItem(title: "Main", icon: "house.fill", view: .main),
                                             NavigationItem(title: "Profile", icon: "person.fill", view: .profile),
                                            ],
                                         width: mainProxy.size.width * 0.95,
                                         height: mainProxy.size.height * 0.07)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
    
    private func mainContentView(mainProxy: GeometryProxy, paddingH: CGFloat, paddingV: CGFloat) -> some View {
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
            .frame(maxHeight: mainProxy.size.height * 0.3)
            .mainBorder(paddingH: paddingH, paddingV: paddingV)
            
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
                            CountFormatter.addCount(to: &progressValue, what: "10")
                            print(mainProxy.size)
                        }
                        ButtonQuickAdd(text: "Custom",
                                       width:availableWidth * 0.28,
                                       height: totalHeight * 0.8) {
                            showAddWindow = true
                        }
                                       
                        ButtonQuickAdd(text: "Set Goal",
                                       backgroundColor: Color.selectedPurpleColor,
                                       textColor: Color.mainBackground,
                                       width:availableWidth * 0.30,
                                       height: totalHeight * 0.8) {
                            showSetGoalView = true
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }
                .frame(height: mainProxy.size.width * 0.1)
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 10)
            .frame(maxHeight: mainProxy.size.height * 0.14)
            .mainBorder(paddingH: paddingH, paddingV: paddingV)
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
                .frame(width: mainProxy.size.width * 0.46,
                       height: mainProxy.size.height * 0.23)
                .mainBorder(paddingH: paddingH / 2, paddingV: paddingV)
                VStack(alignment: .leading) {   // 4 блок
                    HStack {
                        Text("Achievements")
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
                            print(selectedScreen ?? "?")
                        }
                                         .padding(.vertical, 2)
                    }
                }
                .padding(15)
                .frame(width: mainProxy.size.width * 0.46,
                       height: mainProxy.size.height * 0.23)
                .mainBorder(paddingH: paddingH / 2, paddingV: paddingV)
            }
            VStack(alignment: .leading) {   // 6 блок
                HStack {
                    Text("Анализ качества отжиманий")
                        .mainTextStyle(size: 18)
                    Spacer()
                }
                Spacer()
                Text("Средняя оценка за неделю: 85%")
                    .mainTextStyle(size: 15)
                Spacer()
                HStack {
                    ButtonTemplate(text: "Начать тренировку", backgroundColor: Color.selectedPurpleColor, foregroundColor: Color.mainBackground, foregroungSize: 16, paddingH: 20, paddingV: 8) {
                        
                    }
                    Spacer()
                    ButtonTemplate(text: "Подробнее", backgroundColor: Color.selectedPurpleColor, foregroundColor: Color.mainBackground, foregroungSize: 16, paddingH: 20, paddingV: 8) {
                        showTrainingView = true
                    }
                }
            }
            .padding(15)
            .frame(maxWidth: .infinity,
                   maxHeight: mainProxy.size.height * 0.175)
            .mainBorder(paddingH: paddingH, paddingV: paddingV)
        }
        .navigationDestination(isPresented: $showAddWindow) {
            CustomProgressAddScreen(showScreen: $showAddWindow,
                                    progress: $progressValue)
        }
        .navigationDestination(isPresented: $showSetGoalView) {
            SetGoalScreen(showScreen: $showSetGoalView,
                          maxProgress: $maxProgress)
        }
        .navigationDestination(isPresented: $showTrainingView) {
            TrainingView()
        }
    }
    
    
}

#Preview {
    HomeView()
}
