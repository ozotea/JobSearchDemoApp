//
//  JobRowView.swift
//  JobSearchDemoApp
//
//  Created by Soumya on 12/06/26.
//

import Foundation
import SwiftUI

struct JobRowView: View {

    let job: Job
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(job.title)
                .font(.headline)
            Text(job.company)
                .font(.subheadline)
            Text(job.location)
                .font(.caption)
            Text(job.salary)
                .font(.caption)
                .foregroundStyle(.green)
        }
        .padding(.vertical, 8)
    }
}
