//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Badran on 06/08/2022.
//

import SwiftUI

struct FilteredList: View {
    @FetchRequest var fetchRequests: FetchedResults<Singer>
    
    var body: some View {
        List(fetchRequests, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        _fetchRequests = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}
