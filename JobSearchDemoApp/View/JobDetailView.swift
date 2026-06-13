//
//  JobDetailView.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation
import SwiftUI

struct JobDetailView: View {

    @ObservedObject var viewModel: JobDetailViewModel

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: 16
            ) {
                Text(viewModel.job.title)
                    .font(.title2)
                    .bold()
                Text(viewModel.job.company)
                Label(
                    viewModel.job.location,
                    systemImage: "location"
                )
                Text(viewModel.job.salary)
                    .foregroundStyle(.green)
                Divider()
                Text("Description")
                    .font(.headline)
                Text(viewModel.job.description)
            }
            .padding()
        }
        .navigationTitle("Details")
    }
}
