import SwiftUI

struct Trash: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    
    var buttonRestore: some View{
        
    }
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (tasks.toDoElements[index].isDeleted){
                            HStack{
                                Text(tasks.toDoElements[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArcheveted)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArcheveted)
                            }
                        }
                    }
//                    .onDelete(perform: { indexSet in
//                        let index = indexSet[indexSet.startIndex]
//                        tasks.toDoElements[index].isDeleted.toggle()
//                    })
                    .onDelete(perform: self.delete)
                }
                .navigationBarItems(leading: EditButton())
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("Deleted")
        }
    }
    func delete(at offsets : IndexSet) {
        tasks.toDoElements.remove(atOffsets: offsets)
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        Trash(tasks: TaskList())
    }
}
