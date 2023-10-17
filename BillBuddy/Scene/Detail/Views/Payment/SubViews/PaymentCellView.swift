//
//  PaymentCellView.swift
//  BillBuddy
//
//  Created by 김유진 on 10/12/23.
//

import SwiftUI

struct PaymentCellView: View {
    @State var payment: Payment
    var body: some View {
        HStack(spacing: 12){
            Image(payment.type.getImageString(type: .badge))
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 0, content: {
                
                Text(payment.content)
                    .font(.custom("Pretendard-Semibold", size: 14))
                    .foregroundStyle(Color.black)
                HStack(spacing: 4) {
                    // MARK: Rendering 이미지가 전체를 뒤엎음
                    if payment.participants.count == 1 {
                        Image("user-single-neutral-male-4")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color(hex: "858899"))
                            
                    }
                    else if payment.participants.count > 1 {
                        Image("user-single-neutral-male-4-1")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color(hex: "858899"))
                    }
                    Text("\(payment.participants.count)명")
                        .font(.custom("Pretendard-Medium", size: 14))
                        .foregroundStyle(Color(hex: "858899"))
                }
            })
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(payment.payment)원")
                    .foregroundStyle(Color.black)
                    .font(.custom("Pretendard-Bold", size: 14))
                
                if payment.participants.isEmpty {
                    Text("\(payment.payment)원")
                        .foregroundStyle(Color(hex: "858899"))
                        .font(.custom("Pretendard-Medium", size: 12))
                }
                else {
                    Text("\(payment.payment / payment.participants.count)원")
                        .foregroundStyle(Color(hex: "858899"))
                        .font(.custom("Pretendard-Medium", size: 12))
                }
                
            }
            
        }
        .padding(.leading, 16)
        .padding(.trailing, 24)
    }
}
