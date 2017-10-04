//
//  GitHubError.swift
//  GitHub Users Base
//
//  Created by Marcin Pietrzak on 04.10.2017.
//  Copyright © 2017 Marcin Pietrzak. All rights reserved.
//

import Foundation

enum  BackendError {
    case urlError(reason: String)
    case objectSerialization(reason: String)
    case otherError(reason: String)
}
