import SwiftUI

struct AddToDoPage: View {
    @Binding var showSheetView: Bool
    @Binding var addNewElement:[ToDoElement]
    @State var newTodo : String = ""
    
    var ToDoField: some View{
        VStack{
            TextField("enter your todo", text: $newTodo)
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
                addNewElement.append (ToDoElement(id: addNewElement.count + 1, description: newTodo, isDeleted: false, isArcheveted: false))
                self.showSheetView = false
            }, label: {
                Text("Add")
            }))
            
        }
        
    }
}



struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddToDoPage(showSheetView: .constant(false), addNewElement: .constant([]))
    }
}
