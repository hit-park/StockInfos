//
//  MenuView.swift
//  StockInfos
//
//  Created by 희태 박 on 2022/11/09.
//

import SwiftUI

struct MenuView: View {
    static let SPACING : CGFloat    = 20
    private var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: MenuView.SPACING), count: 2)

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    Text("메뉴")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: MenuView.SPACING) {
                            ForEach(Menu.allCases, id: \.self) { menu in
                                let wh: CGFloat = proxy.size.width > 0 ? (proxy.size.width - 60) / 2 : 0
                                NavigationLink(value: menu) {
                                    Text(menu.title)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(width: wh, height: wh)
                                        .background(Color(red: 0.018, green: 0.641, blue: 0.859))
                                        .cornerRadius(15)
                                }
                            }
                        }
                        .padding(.horizontal, MenuView.SPACING)
                        .navigationDestination(for: Menu.self) { ListView(menu: $0) }
                    }
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}


enum Menu: String, CaseIterable {
    case getStkIsinByNmN1
    case getStkIsinByShortIsinN1
    case getDividendRankN1             
    case getSafeDpDutyDepoStatusN1     
    case getSafeDpDutyDepoRgtStatusN1  
    case getNewDepoSecnListN1          
    case getListStatN1                 
    case getStkListInfoN1              
    case getXrcStkStatInfoN1           
    case getXrcStkOptionXrcInfoN1      
    case getDocInfoN1                  
    case getWrtInfoN1                  
    case getShotnByMartN1              
    case getKDRIssuLmtDetailsN1        
    case getSecSetlCostStatN1          
    case getTotIssuStkQty              
    case getBuyDmanRsn                 
    case getKDRSecnInfo                
    case getVctfDivRankInfo            
    case getLostStkInfo                
    
    var title: String {
        switch self {
        case .getStkIsinByNmN1               : return "종목명칭으로 주식종목코드 및 기본정보 조회"
        case .getStkIsinByShortIsinN1        : return "단축번호로 주식종목코드(풀코드) 조회"
        case .getDividendRankN1              : return "배당순위조회"
        case .getSafeDpDutyDepoStatusN1      : return "의무보호예수전체현황 전체현황표 조회"
        case .getSafeDpDutyDepoRgtStatusN1   : return "의무보호예수전체현황 사유별조회"
        case .getNewDepoSecnListN1           : return "신규예탁지정 종목조회"
        case .getListStatN1                  : return "상장구분별 현황조회"
        case .getStkListInfoN1               : return "주식상장정보 조회"
        case .getXrcStkStatInfoN1            : return "주식관련사채정보 조회"
        case .getXrcStkOptionXrcInfoN1       : return "주식관련사채 행사조건정보 조회"
        case .getDocInfoN1                   : return "신주인수권증서 정보 조회"
        case .getWrtInfoN1                   : return "신주인수권증권 정보 조회"
        case .getShotnByMartN1               : return "시장별 단축코드 전체 조회"
        case .getKDRIssuLmtDetailsN1         : return "KDR 발행한도 내역"
        case .getSecSetlCostStatN1           : return "월별 주식결제대금 현황"
        case .getTotIssuStkQty               : return "상장시장별 총발행주식수 현황 조회"
        case .getBuyDmanRsn                  : return "매수청구사유조회"
        case .getKDRSecnInfo                 : return "시장별 KDR 종목 전체 조회"
        case .getVctfDivRankInfo             : return "유가증권시장 배당순위 조회"
        case .getLostStkInfo                 : return "주권 사고신고 조회"
        }
    }
}

    
    

