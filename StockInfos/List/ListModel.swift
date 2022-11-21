//
//  ListModel.swift
//  StockInfos
//
//  Created by 희태 박 on 2022/11/15.
//

import Foundation
import Alamofire
import XMLCoder

struct Item: Codable {
    let engSecnNm   : String?
    let isin        : String
    let issuDt      : Int
    let issucoCustno: Int
    let korSecnNm   : String
    let secnKacdNm  : String
    let shotnIsin   : Int
}

struct Response<T>: Codable where T: Codable {
    struct Header: Codable {
        let resultCode: Int
        let resultMsg : String
    }
    
    struct Body: Codable {
        struct Items: Codable {
            let item: [T]
        }
        let items       : Items
        let numOfRows   : Int
        let pageNo      : Int
        let totalCount  : Int
    }
    
    let header  : Header
    let body    : Body
}

class ListModel {
    private let baseUrl     : String = "http://api.seibro.or.kr/openapi/service/StockSvc/"
    private let serviceKey  : String = "d+UcqKLHspPCvahGMg+CrQnSzMYvkw9R97K40wm+dmMBHNh48GT+Qr4QzZezosSxhxxq+H6SrNi/r/kADnxpqw=="
    private var page        : Int    = 1
    private var numOfRows   : Int    = 10
    private let menu        : Menu
    
    var completiton: ((Response<Item>?) -> Void) = { _ in }
    
    init(menu: Menu) {
        self.menu = menu
        fetch()
    }
    
    private func fetch() {
        var param: [String : Any] = [
            "serviceKey": serviceKey,
            "numOfRows" : numOfRows,
            "pageNo"    : page
        ]
        
        AF.request(
            "\(baseUrl + menu.rawValue)",
            parameters: param
        )
        .response { [weak self] res in
            switch res.result {
            case .success(let data):
                guard let data = data else { return }
                self?.completiton(self?.decoding(data: data))
            case .failure(_):
                break
            }
        }
    }
    
    private func decoding<T>(data: Data) -> T? where T: Decodable {
        var entity: T?
        do {
            entity = try XMLDecoder().decode(T.self, from: data)
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
        return entity
    }

}
