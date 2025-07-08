//
//  ColumnHeaders.swift
//  TagFixer
//
//  Created by Bobbi R. on 8.07.25.
//
import SwiftUI

struct TrackListHeader: View {
    var body: some View {
        HStack {
            ForEach(ColumnHeader.allCases, id: \.self) { header in
                Text(header.rawValue)
                    .font(.system(size: 12, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.top)
        .padding(.leading)
        .padding(.trailing)
    }
}
#Preview {
    TrackListHeader()
}
