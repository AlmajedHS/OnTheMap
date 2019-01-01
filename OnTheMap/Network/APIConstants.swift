//
//  APIConstants.swift
//  OnTheMap
//
//  Created by Hussain Almajed on 12/31/18.
//  Copyright © 2018 UdacityHS. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}


struct APIConstants {
    
    static let PARSE_APP_ID_V = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
    static let PARSE_API_KEY_V = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
    
    static let PARSE_APP_ID_K = "X-Parse-Application-Id"
    static let PARSE_API_KEY_K = "X-Parse-REST-API-Key"
    
    
    static let LIMIT = "limit"
    static let SKIP = "skip"
    static let ORDER = "order"
    
    
    private static let MAIN = "https://parse.udacity.com"
    static let SESSION = "https://onthemap-api.udacity.com/v1/session"
    static let PUBLIC_USER = "https://onthemap-api.udacity.com/v1/users/"
    static let STUDENT_LOCATION = MAIN + "/parse/classes/StudentLocation"
    
}

