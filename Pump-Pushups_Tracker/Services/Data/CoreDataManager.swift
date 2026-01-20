class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Pusm-Pushups_Tracker")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Database loading error: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
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
    
    func createUser(name: String, countPushUps: Int16) {
        let id = UUID()
        let user = User(context: context)
        user.id = id
        user.name = name
        user.countPushUps = countPushUps
        save()
    }
    
    func deleteUser(object: NSManagedObject) {
        context.delete(object)
        save()
    }
}
