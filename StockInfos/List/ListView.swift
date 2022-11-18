//
//  ListView.swift
//  StockInfos
//
//  Created by 희태 박 on 2022/11/15.
//

import SwiftUI

struct ListView: View {
    
    private var model: ListModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    init(menu: Menu) {
        model = ListModel(menu: menu)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(menu: .getBuyDmanRsn)
    }
}
