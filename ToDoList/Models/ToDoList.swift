import SwiftUI

struct ToDoList: View {
    @ObservedObject var tasks: TaskList
    @State var isSet: Bool = false
    @State var showSheetView = false
    
    var buttonAdd: some View {
        HStack{
            Button(action: {self.showSheetView.toggle()}, label: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.yellow)
            })
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                List {
                    ForEach(tasks.toDoElements.indices, id: \.self) { index in
                        if (!tasks.toDoElements[index].isDeleted && !tasks.toDoElements[index].isArcheveted) {
                            HStack {
                                Text(tasks.toDoElements[index].description)
                                    .strikethrough(tasks.toDoElements[index].isArcheveted)
                                Spacer()
                                CheckButton(isSet: $tasks.toDoElements[index].isArcheveted)
                            }
                        }
                        
                    }
                    .onDelete(perform: { indexSet in
                        let index = indexSet[indexSet.startIndex]
                        tasks.toDoElements[index].isDeleted.toggle()
                    })
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: buttonAdd)
            .sheet(isPresented: $showSheetView){
                AddToDoPage(showSheetView: self.$showSheetView, addNewElement: self.$tasks.toDoElements)
            }
        }
        .padding(0.0)
    }
}

struct RowsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoList(tasks: TaskList())
    }
}