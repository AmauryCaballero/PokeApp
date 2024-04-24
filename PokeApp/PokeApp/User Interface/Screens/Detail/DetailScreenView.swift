//
//  DetailScreenView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import SwiftUI

struct DetailScreenView: View {
    @ObservedObject var viewModel: DetailScreenViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}
