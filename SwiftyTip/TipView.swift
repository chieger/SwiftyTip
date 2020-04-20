//
//  ContentView.swift
//  SwiftyTip
//
//  Created by Charles Hieger on 4/17/20.
//  Copyright © 2020 Charles Hieger. All rights reserved.
//

import SwiftUI

struct TipCalculatorView: View {

    //@ObservedObject var tipCalculatorViewModel: TipCalculatorViewModel

    @State var billAmountString: String = ""
    @State var tipPercentageString: String = ""
    @State var totalAmountString: String = ""

    @State var billAmount: Double = 0
    @State var tipPercentage: Double = 0
    @State var totalAmount: Double = 0

//    init() {
//        tipCalculatorViewModel = TipCalculatorViewModel(billAmountString: $billAmountString, tipPercentageString: $tipPercentageString, totalAmountString: $totalAmountString)
//    }

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "dollarsign.circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .padding(.horizontal, 100 )
                .padding(.vertical, 20)
                .background(Color.purple)
            TextField("$ Bill Amount", text: $billAmountString, onEditingChanged: { _ in
                self.billAmount. = Double(self.billAmountString)
                })
                .font(.system(.largeTitle))
                .padding(.horizontal, 20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            TextField("% Tip Percentage", text: $tipPercentageString)
                .font(.system(.largeTitle))
                .padding(.horizontal, 20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            TextField("$ Total Amount", text: $totalAmountString)
                .font(.system(.largeTitle))
                .padding(.horizontal, 20)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            Spacer()

        }
        .background(Color.blue)
    }
}

struct TipCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TipCalculatorView()
    }
}
