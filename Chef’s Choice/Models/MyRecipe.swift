//
//  MyRecipe.swift
//  Chef’s Choice
//
//  Created by Дарья Кобелева on 30.06.2024.
//

import SwiftUI
import RealmSwift

final class MyRecipe: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var ingredients: RealmSwift.List<String>
    @Persisted var instruction: String
    @Persisted var imageData: Data?
}
