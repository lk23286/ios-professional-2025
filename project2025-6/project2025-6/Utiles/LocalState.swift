//
//  LocalState.swift
//  project2025-6
//
//  Created by Laszlo Kovacs on 2025. 03. 15..
//
import Foundation

public class LocalState {
    private enum Keys: String {
        case hasOnboarding
    }
    public static var hasOnboarding: Bool {
        get { return UserDefaults.standard.bool(forKey: Keys.hasOnboarding.rawValue)}
        set(newValue) { UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarding.rawValue)}
    }
}
