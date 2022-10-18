# TestTaskNumbers

To compile the project, you need to add this code to the RealmSwift -> SwiftUI.swift file between lines 1232 and 1233.

    func insert(_ value: Value.Element) {
        // if the value is unmanaged but the list is managed, we are adding this value to the realm
        if value.realm == nil && self.wrappedValue.realm != nil {
            SwiftUIKVO.observedObjects[value]?.cancel()
        }
        safeWrite(self.wrappedValue) { list in
            list.insert(thawObjectIfFrozen(value), at: 0)
        }
    }
