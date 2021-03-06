//
//  Module.swift
//  NetatmoSwiftSDK
//
//  Created by James Barrow on 2019-10-23.
//  Copyright © 2019 Pig on a Hill Productions. All rights reserved.
//

import Foundation

public extension NetatmoWeather {
    
    struct Module: Decodable, CustomStringConvertible {
        
        // MARK: - Properties
        
        /// MAC address of the module.
        public let identifier: String
        private let rawType: String
        /// Type of the device.
        public var type: ProductType { ProductType(rawValue: rawType) }
        /// Name of the module.
        public let name: String
        /// Array of data measured by the device (e.g. "Temperature", "Humidity").
        public let dataType: [String]
        /// Date of the last installation.
        public let lastSetupDate: Date
        /// `true` if the station connected to Netatmo cloud within the last 4 hours.
        public let reachable: Bool
        /// Version of the software.
        public let firmware: Int
        /// Date of the last measure update.
        public let lastMessageDate: Date
        /// Date of the last status update.
        public let lastSeenDate: Date
        /// Current radio status per module. (90=low, 60=highest).
        public let rfStatus: Int
        /// Current battery status per module/
        public let batteryVp: Int
        /// Percentage of battery remaining (10=low).
        public let batteryPercent: Int
        public let dashboard: Dashboard
        
        public var description: String {
            "Module(type: \(type), name: \(name), dashboard: \(dashboard))"
        }
        
        // MARK: - Coding
        
        private enum CodingKeys: String, CodingKey {
            case identifier = "_id"
            case rawType = "type"
            case name = "module_name"
            case dataType = "data_type"
            case lastSetupDate = "last_setup"
            case reachable
            case firmware
            case lastMessageDate = "last_message"
            case lastSeenDate = "last_seen"
            case rfStatus = "rf_status"
            case batteryVp = "battery_vp"
            case batteryPercent = "battery_percent"
            case dashboard = "dashboard_data"
        }
        
        // MARK: - Init
        
        public init(identifier: String, type: ProductType, name: String, dataType: [String], lastSetupDate: Date, reachable: Bool, firmware: Int, lastMessageDate: Date, lastSeenDate: Date, rfStatus: Int, batteryVp: Int, batteryPercent: Int, dashboard: Dashboard) {
            
            self.identifier = identifier
            self.rawType = type.rawValue
            self.name = name
            self.dataType = dataType
            self.lastSetupDate = lastSetupDate
            self.reachable = reachable
            self.firmware = firmware
            self.lastMessageDate = lastMessageDate
            self.lastSeenDate = lastSeenDate
            self.rfStatus = rfStatus
            self.batteryVp = batteryVp
            self.batteryPercent = batteryPercent
            self.dashboard = dashboard
        }
        
    }
}
