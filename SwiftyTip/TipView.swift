//
//  TipView.swift
//  SwiftyTip
//
//  Created by Charles Hieger on 4/17/20.
//  Copyright © 2020 Charles Hieger. All rights reserved.
//

import SwiftUI

struct TipView: View {

    @ObservedObject var viewModel: TipViewModel

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    self.endEditing()
                }
            VStack(spacing: 20) {
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 20, leading: 80, bottom: 20, trailing: 80))
                    .allowsHitTesting(false) // Prevents blocking taps to background view.
                HStack {
                    Text(viewModel.currenySymbol)
                        .foregroundColor(Color.white)
                    TextField("Bill Amount", text: $viewModel.billAmountString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }.font(.system(.largeTitle))
                Picker(selection: $viewModel.tipPercentageIndex, label: Text("Tip Percentage")) {
                    ForEach(0..<viewModel.tipPercentageOptions.count) { index in
                        Text("\(self.viewModel.tipPercentageOptions[index])%").tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                HStack(spacing: 40) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tip")
                        Text("\(viewModel.tipString)")
                            .bold()
                    }.foregroundColor(Color.white)
                    Color.white
                        .frame(width: 1, height: 60)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Total")
                        Text("\(viewModel.totalString)")
                            .bold()
                    }.foregroundColor(Color.white)
                }.font(.system(.largeTitle))
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }

    /// Relinquishes focus from any text field currently in focus and dismisses the keyboard..
    func endEditing() {
        UIApplication.shared.endEditing()
    }
}

extension UIApplication {

    /// Prompts the first responder to resign. In the case of a TextField, this triggers the keyoard to be dismissed.
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#if DEBUG
struct TipCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        TipView(viewModel: TipViewModel())
    }
}
#endif
