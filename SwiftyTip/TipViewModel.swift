//
//  TipViewModel.swift
//  SwiftyTip
//
//  Created by Charles Hieger on 4/17/20.
//  Copyright © 2020 Charles Hieger. All rights reserved.
//

import Foundation

class TipViewModel: ObservableObject {

    @Published var billAmountString = ""
    @Published var tipPercentageIndex = 0

    /// An array of tip percentage options.
    var tipPercentageOptions = [15, 18, 20]

    /// The formatted tip amount.
    var tipString: String {
        let tip = tipAmount ?? 0
        return numberFormatter.string(from: tip as NSNumber) ?? ""
    }

    /// The formatted total amount owed.
    var totalString: String {
        let total = totalAmount ?? 0
        return numberFormatter.string(from: total as NSNumber) ?? ""
    }

    /// The curreny symbol for the current locale.
    var currenySymbol: String {
        numberFormatter.currencySymbol
    }

    /// A number formatter with currency style.
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()

    /// The bill amount represented as a `Double`.
    private var billAmount: Double? {
        Double(billAmountString)
    }

    /// The amount of tip to add to the bill given the current bill amount and tip percentage selection. (bill * tip percentage).
    private var tipAmount: Double? {
        guard let billAmount = billAmount else  { return nil }
        let tipPercentage = Double(tipPercentageOptions[tipPercentageIndex]) / 100
        return billAmount * tipPercentage
    }

    /// The total amount owed given the current bill and tip amount. (bill + tip).
    private var totalAmount: Double? {
        guard let tipAmount = tipAmount,
            let billAmount = billAmount else { return nil }
        return billAmount + tipAmount
    }
}
