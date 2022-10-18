//
//  Object.swift
//  TestTaskNumbers
//
//  Created by Viacheslav Tolstopianteko on 16.10.2022.
//

import Foundation
import RealmSwift

final class Item: Object, ObjectKeyIdentifiable {
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted var date = Date()
	@Persisted var text: String = ""
	@Persisted var number: Int = 0
	@Persisted var found: Bool = false
	@Persisted(originProperty: "items") var itemGroup: LinkingObjects<ItemGroup>
}

final class ItemGroup: Object, ObjectKeyIdentifiable {
	@Persisted(primaryKey: true) var _id: ObjectId
	@Persisted var items = RealmSwift.List<Item>()
}

