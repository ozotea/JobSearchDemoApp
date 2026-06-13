//
//  JobListView.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation
import SwiftUI

struct JobListView: View {

    @StateObject private var viewModel: JobListViewModel
    
    init(viewModel: JobListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Jobs")
                .searchable(text: $viewModel.searchText)
                .task {
                    await viewModel.loadJobs()
                }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView()
        case .empty:
            ContentUnavailableView(
                "No Jobs",
                systemImage: "briefcase"
            )
        case .error(let message):
            ContentUnavailableView(
                message,
                systemImage: "exclamationmark.triangle"
            )
        case .success:
            List(viewModel.filteredJobs) { job in
                NavigationLink {
                    JobDetailView(
                        viewModel: JobDetailViewModel(job: job)
                    )
                } label: {
                    JobRowView(job: job)
                }
            }
        }
    }
}
