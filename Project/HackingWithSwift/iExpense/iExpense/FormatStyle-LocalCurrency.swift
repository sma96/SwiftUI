//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by 마석우 on 2022/08/03.
//

import SwiftUI

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
