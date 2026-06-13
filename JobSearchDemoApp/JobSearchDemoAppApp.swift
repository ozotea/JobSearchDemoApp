//
//  JobSearchDemoAppApp.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import SwiftUI
import SwiftData

@main
struct JobSearchDemoAppApp: App {
    let container = AppContainer()
    var body: some Scene {
        WindowGroup {
            JobListView(
                viewModel: JobListViewModel(
                    repository: container.repository
                )
            )
        }
    }
}
