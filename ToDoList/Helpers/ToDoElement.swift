import Foundation
import SwiftUI

struct ToDoElement: Codable, Identifiable {
    var id: Int
    var description: String
    var isDeleted: Bool
    var isArcheveted: Bool
}
