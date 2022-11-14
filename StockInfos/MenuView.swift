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
        GeometryReader { proxy in
            VStack {
                Text("메뉴")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: MenuView.SPACING) {
                        ForEach(Menu.allCases, id: \.self) { menu in
                            let wh: CGFloat = (proxy.size.width - 60) / 2
                            Button {
                                print("\(menu.rawValue)")
                            }
                            label: {
                                Text(menu.rawValue)
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
    case getStkIsinByNmN1               = "종목명칭으로 주식종목코드 및 기본정보 조회"
    case getStkIsinByShortIsinN1        = "단축번호로 주식종목코드(풀코드) 조회"
    case getDividendRankN1              = "배당순위조회"
    case getSafeDpDutyDepoStatusN1      = "의무보호예수전체현황 전체현황표 조회"
    case getSafeDpDutyDepoRgtStatusN1   = "의무보호예수전체현황 사유별조회"
    case getNewDepoSecnListN1           = "신규예탁지정 종목조회"
    case getListStatN1                  = "상장구분별 현황조회"
    case getStkListInfoN1               = "주식상장정보 조회"
    case getXrcStkStatInfoN1            = "주식관련사채정보 조회"
    case getXrcStkOptionXrcInfoN1       = "주식관련사채 행사조건정보 조회"
    case getDocInfoN1                   = "신주인수권증서 정보 조회"
    case getWrtInfoN1                   = "신주인수권증권 정보 조회"
    case getShotnByMartN1               = "시장별 단축코드 전체 조회"
    case getKDRIssuLmtDetailsN1         = "KDR 발행한도 내역"
    case getSecSetlCostStatN1           = "월별 주식결제대금 현황"
    case getTotIssuStkQty               = "상장시장별 총발행주식수 현황 조회"
    case getBuyDmanRsn                  = "매수청구사유조회"
    case getKDRSecnInfo                 = "시장별 KDR 종목 전체 조회"
    case getVctfDivRankInfo             = "유가증권시장 배당순위 조회"
    case getLostStkInfo                 = "주권 사고신고 조회"
}

    
    

