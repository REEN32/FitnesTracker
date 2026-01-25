class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Pump-Pushups_Tracker")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Database loading error: \(error)")
            }
        }
        
        if getUsers().isEmpty {
            createUser(name: "Default", countPushUps: 0, maxPushUps: 100)
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func changeCount(count: Int16) {
        let user = getUser()
        guard let user else { print("Get user error: nil"); return }
        user.countPushUps += count
    }
    
    func setMaxCount(maxCount: Int16) {
        let user = getUser()
        guard let user else { print("Get user error: nil"); return }
        user.maxPushUps = maxCount
    }
    
    func getCount() -> Int16 {
        let user = getUser()
        guard let user else { print("Get user error: nil"); return 0 }
        return user.countPushUps
    }
    
    func getMaxCount() -> Int16 {
        let user = getUser()
        guard let user else { print("Get user error: nil"); return 0 }
        return user.maxPushUps
    }
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Database saving error: \(error)")
            }
        }
    }
    
    private func getUsers() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("User loading error: \(error)")
            return []
        }
    }
    
    func getUser() -> User? {
        let users = getUsers()
        return users.first
    }
    
    func createUser(name: String, countPushUps: Int16, maxPushUps: Int16) {
        let id = UUID()
        let user = User(context: context)
        user.id = id
        user.name = name
        user.countPushUps = countPushUps
        user.maxPushUps = maxPushUps
        save()
    }
    
    func deleteUser(object: NSManagedObject) {
        context.delete(object)
        save()
    }
}
