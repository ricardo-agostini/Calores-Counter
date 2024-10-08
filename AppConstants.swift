//
//  AppConstants.swift
//  CaloriesCounter
//
//  Created by Ricardo de Agostini Neto on 29/06/24.
//

import Foundation
import SwiftData
import SwiftOpenAI

/*
 Thanks to James Rochabrun for his excellent work on the SwiftOpenAI library.
 His license for SwiftOpenAI is reproduced here:

 MIT License

 Copyright (c) 2023 James Rochabrun

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

enum AppConstants {
    static let videoSampleQueue = DispatchQueue(label: "com.AIProxyBootstrap.videoSampleQueue")

    #warning(
        """
        You must follow the AIProxy integration guide to build and run on device.
        Please see https://www.aiproxy.pro/docs/integration-guide.html")
        """
    )
    static let openAI: some OpenAIService = OpenAIServiceFactory.service(
        aiproxyPartialKey: "v1|9165bd92|1|WVfTDCW0S-azVFHb"
    )
}
