struct CustomProgressAddScreen : View {
    @Binding var showScreen: Bool
    
    @State var selectedProgress: Int = 0
    @State var showCustomAddWindow: Bool = false
    
    let goal = (1...9999).filter { $0 % 5 == 0 || $0 == 9999}
    
    
    var body: some View {
        ZStack {
            Color.mainBackground
                .ignoresSafeArea()
            GeometryReader { proxy in
                VStack {
                    Spacer()
                    HStack {
                        Text("–")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundStyle(Color.selectedPurpleColor)
                        Picker("Progress", selection: $selectedProgress) {
                            ForEach(goal, id:\.self) { g in
                                Text("\(g)")
                                    .font(.system(size: 30, weight: .semibold))
                                    .foregroundStyle(Color.selectedPurpleColor)
                            }
                        }
                        .pickerStyle(.wheel)
                        Text("–")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundStyle(Color.selectedPurpleColor)
                    }
                    .frame(width: proxy.size.width * 0.5, height: proxy.size.height * 0.7)
                    VStack(spacing: 18) {
                        ButtonSetGoal(text: "Save progress", backgroundColor: Color.selectedPurpleColor, textColor: Color.mainBackground, width: .infinity, height: proxy.size.height * 0.07) {
                            if CoreDataManager.shared.getCount() + Int16(selectedProgress) <= 9999 {
                                CoreDataManager.shared.changeCount(count: Int16(selectedProgress))
                                showScreen = false
                            }
                            else {
                                 
                            }
                        }
                        .padding(.horizontal, 8)
                        ButtonSetGoal(text: "Custom progress", width: .infinity, height: proxy.size.height * 0.07) {
                            showCustomAddWindow = true
                        }
                        .padding(.horizontal, 8)
                        ButtonSetGoal(text: "Cancel", width: .infinity, height: proxy.size.height * 0.07) {
                            showScreen = false
                        }
                        .padding(.horizontal, 8)
                    }
                }
                .navigationTitle("Add Custom Progress")
            }
            if showCustomAddWindow {
                AddModalWindow(
                    showWindow: $showCustomAddWindow,
                    showScreen: $showScreen
                )
            }
        }
    }
}

//#Preview {
//    SetGoalView()
//}
