//
//  JobDetailViewModel.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation
import Combine

final class JobDetailViewModel: ObservableObject {
    let job: Job
    init(job: Job) {
        self.job = job
    }
}
