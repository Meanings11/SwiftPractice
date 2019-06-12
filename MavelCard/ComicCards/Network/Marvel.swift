/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import Moya

public enum Marvel {
  static private let publicKey = "93dca7b126d3163063e4f601999543cc"
  static private let privateKey = "04e2880eedaaeb14b16efc06c75e39bdc7ece7b9"
  
  case comics
  
}

extension Marvel: TargetType {
  public var baseURL: URL {
    return URL(string: "https://gateway.marvel.com/v1/public")!
  }
  
  public var path: String {
    switch self {
    case .comics:
      return "/comics"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .comics:
      return .get
    }
  }
    
  public var sampleData: Data {
    return Data()
  }
    
  public var task: Task {
    let timeSlot = "\(Date().timeIntervalSince1970)"
    let hash = (timeSlot + Marvel.privateKey + Marvel.publicKey).md5
    
    let authParams = ["apikey": Marvel.publicKey, "ts": timeSlot, "hash": hash]
    
    switch self {
    case .comics:
      return .requestParameters(
        parameters: [
          "format": "comic",
          "formatType": "comic",
          "orderBy": "-onsaleDate",
          "dateDescriptor": "lastWeek",
          "limit": 50] + authParams,
        encoding: URLEncoding.default)
    }
  }
    
  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }
    
  public var validationType: ValidationType {
    return .successCodes
  }
}
