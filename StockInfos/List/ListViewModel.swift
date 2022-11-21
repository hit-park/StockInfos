//
//  ListViewModel.swift
//  StockInfos
//
//  Created by 희태 박 on 2022/11/15.
//

import Foundation

class ListViewModel {
    
    private var model: ListModel
    
    var response: Response<Item>?
    
    init(menu: Menu) {
        model = ListModel(menu: menu)
        model.completiton = { [weak self] in self?.response = $0; print($0) }
    }
    
}
