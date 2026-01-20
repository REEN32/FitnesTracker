@main
struct Pump_Pushups_TrackerApp: App {
    let coreDataManager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
