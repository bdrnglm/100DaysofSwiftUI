//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Badran on 06/08/2022.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequests: FetchedResults<T>
    
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequests, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequests = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}
