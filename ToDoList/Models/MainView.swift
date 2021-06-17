import SwiftUI

struct MainView: View {
    @State var number = 0
    @StateObject var tasks = TaskList()
    var body: some View {
        TabView(selection: $number) {
            Archive(tasks: tasks)
                .tabItem {
                    Label("Archeve", systemImage:
                            "archivebox")
                }
                .tag(1)
            ToDoList(tasks: tasks)
                .tabItem {
                    Label("Main", systemImage:
                            "house")
                }
                .tag(0)
            Trash(tasks: tasks)
                .tabItem {
                    Label("Trash", systemImage:
                            "trash")
                }
                .tag(2)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(tasks: TaskList())
    }
}
