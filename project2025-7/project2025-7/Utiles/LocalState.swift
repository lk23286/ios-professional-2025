//
//  LocalState.swift
//  project2025-7
//
//  Created by Laszlo Kovacs on 2025. 03. 18..
//
import Foundation
public class LocalState {
    
    private enum Keys: String {
        case hasOnboarding
    }
    
    public static var hasOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.hasOnboarding.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarding.rawValue)
        }
    }
}
