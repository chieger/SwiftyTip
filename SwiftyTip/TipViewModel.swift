//
//  TipCalculatorViewModel.swift
//  SwiftyTip
//
//  Created by Charles Hieger on 4/17/20.
//  Copyright © 2020 Charles Hieger. All rights reserved.
//

import Foundation
import SwiftUI

class TipCalculatorViewModel: ObservableObject {

    @Binding var billAmountString: String
    @Binding var tipPercentageString: String
    @Binding var totalAmountString: String

    init(billAmountString: Binding<String>, tipPercentageString: Binding<String>, totalAmountString: Binding<String>) {
        self._billAmountString = billAmountString
        self._tipPercentageString = tipPercentageString
        self._totalAmountString = totalAmountString
    }
}
