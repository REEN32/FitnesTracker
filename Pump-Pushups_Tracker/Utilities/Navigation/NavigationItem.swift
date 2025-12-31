struct NavigationItem: Hashable, Equatable {
    let title: String
    let icon: String
    let view: ViewType

    
    enum ViewType: Hashable {
        case main
        case profile
        case stats
        
        @ViewBuilder
        var view: some View {
            switch self {
                case .main:
                    HomeView()
            case .profile:
                SettingsView()
            case .stats:
                StatsView()
            }
        }
    }
}
