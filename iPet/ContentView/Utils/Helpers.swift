//
//  Helpers.swift
//  iPet
//
//  Created by Byron Mejia on 5/24/22.
//

import SwiftUI

func calcTimeSince(date: Date) -> Int {
    Int(-date.timeIntervalSinceNow)
}

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
}
