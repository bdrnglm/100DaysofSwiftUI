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
    
    enum Predicate {
        case beginsWith
        case contains
    }
    
    init(filterKey: String, filterValue: String, predicate: Predicate, @ViewBuilder content: @escaping (T) -> Content) {
        var predicateString: String {
            switch predicate {
            case .beginsWith:
                return "BEGINSWITH"
            case .contains:
                return "CONTAINS"
            }
        }
        _fetchRequests = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(predicateString) %@", filterKey, filterValue))
        self.content = content
    }
}
