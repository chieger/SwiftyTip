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
        VStack(spacing: 20) {
            Image(systemName: "dollarsign.circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .foregroundColor(Color.green)
                .padding(.horizontal, 80)
                .padding(.vertical, 20)
            HStack {
                Text(viewModel.currenySymbol)
                    .foregroundColor(Color.green)
                TextField("Bill Amount", text: $viewModel.billAmountString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }.font(.system(.largeTitle))
            Picker(selection: $viewModel.tipPercentageIndex, label: Text("Tip Percentage")) {
                ForEach(0..<viewModel.tipPercentageOptions.count) { index in
                    Text("\(self.viewModel.tipPercentageOptions[index])%").tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            HStack(spacing: 40) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Tip")
                        .foregroundColor(Color.green)
                    Text("\(viewModel.tipString)")
                }
                Color.gray
                    .frame(width: 1, height: 60)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Total")
                        .foregroundColor(Color.green)
                    Text("\(viewModel.totalString)")
                }
            }.font(.system(.largeTitle))
            Spacer()
        }
        .padding(.horizontal, 20)
        .onTapGesture {
            self.endEditing()
        }
    }

    func endEditing() {
        UIApplication.shared.endEditing()
    }
}

extension UIApplication {
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
