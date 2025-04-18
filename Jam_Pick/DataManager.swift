//
//  DataManager.swift
//  Jam_Pick
//
//  Created by 지구 on 4/18/25.
//

import Foundation

struct JamStorage {
    static let fileName = "jams.json"

    static func load() -> [Jam] {
        let url = getURL()
        guard let data = try? Data(contentsOf: url) else { return [] }
        let decoder = JSONDecoder()
        return (try? decoder.decode([Jam].self, from: data)) ?? []
    }

    static func save(jam: Jam) {
        var current = load()
        current.append(jam)
        saveAll(jams: current)
    }

    static func saveAll(jams: [Jam]) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(jams)
            let url = getURL()
            try data.write(to: url)
        } catch {
            print("저장 실패: \(error)")
        }
    }

    static private func getURL() -> URL {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        return url.appendingPathComponent(fileName)
    }
}
