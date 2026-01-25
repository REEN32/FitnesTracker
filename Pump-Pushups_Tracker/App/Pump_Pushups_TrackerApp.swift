@main
struct Pump_Pushups_TrackerApp: App {
    let coreDataManager = CoreDataManager.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .onChange(of: scenePhase) { _, newPhase in
            if newPhase == .background {
                CoreDataManager.shared.save()
            }
        }
    }
}
