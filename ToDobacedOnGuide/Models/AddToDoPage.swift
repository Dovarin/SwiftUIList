import SwiftUI
import Combine

struct AddToDoPage: View {
    @Binding var showSheetView: Bool
    @Binding var addnewtodo: [ToDoElement]
    @State var newTodo : String = ""
    
    var ToDoField: some View{
          VStack{
               TextField("enter your todo", text: self.$newTodo)
                .textFieldStyle(RoundedBorderTextFieldStyle())
          }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                ToDoField
                    .padding()
                Spacer()
            }
            .navigationBarTitle(Text("New ToDo"), displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                    self.showSheetView = false
                })
            {
                    Text("Cancel").bold()
            },
            trailing: Button(action: {
                addnewtodo.append(ToDoElement(id: addnewtodo.count + 1, isDone: false, description: newTodo, isDeleted: false, isArcheveted: false))
                self.showSheetView = false
            }, label: {
                Text("Add")
            }))
        }
    }
}



struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoPage(showSheetView: .constant(false), addnewtodo: .constant([]))
    }
}