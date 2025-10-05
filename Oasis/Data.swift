//
//  Data.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import Foundation

class CustomData {
    static let modulString = """
        {
            "content": [
                {
                    "id": "M-001",
                    "title": "Douglas Adams",
                    "status": "Active",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.73,
                    "temperatureValue": "18°C",
                    "processValue": 0.46,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-002",
                    "title": "Dog one ose",
                    "status": "Optina card",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.14,
                    "temperatureValue": "18°C",
                    "processValue": 0,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-003",
                    "title": "Douglas Adams",
                    "status": "Optinal",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 1,
                    "temperatureValue": "18°C",
                    "processValue": 0,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-004",
                    "title": "moduls boss",
                    "status": "Optinal career",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.12,
                    "temperatureValue": "18°C",
                    "processValue": 0.05,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-005",
                    "title": "Flux Capacitor",
                    "status": "Pending Review",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.55,
                    "temperatureValue": "18°C",
                    "processValue": 0.20,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-006",
                    "title": "Deep Thought",
                    "status": "Completed",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.99,
                    "temperatureValue": "18°C",
                    "processValue": 1.00,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-007",
                    "title": "Zaphod Beeblebrox",
                    "status": "On Hold",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.30,
                    "temperatureValue": "18°C",
                    "processValue": 0.15,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-008",
                    "title": "Heart of Gold",
                    "status": "Deploying",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.88,
                    "temperatureValue": "18°C",
                    "processValue": 0.75,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-009",
                    "title": "Vogon Poetry",
                    "status": "Critical Error",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.05,
                    "temperatureValue": "18°C",
                    "processValue": 0.00,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                },
                {
                    "id": "M-010",
                    "title": "Mostly Harmless",
                    "status": "Active",
                    "statusColorHex": "#000000",
                    "iconName": "cube",
                    "iconColorHex": "#FFFFFF",
                    "energyValue": 0.77,
                    "temperatureValue": "18°C",
                    "processValue": 0.50,
                    "task": "1979",
                    "interaction": "adsadasdasdas",
                    "materials": [
                        {
                            "title": "Science Fiction",
                            "value": 0.36
                        },
                        {
                            "title": "encection",
                            "value": 0.74
                        }
                    ]
                }
            ]
        }
        """
    
    
    static let robotString = """
        {
            "content": [
                {
                    "id": "01",
                    "name": "Alpha",
                    "task": "Active",
                    "battery": 0.95,
                    "health": 1.0,
                    "color": "#0AF181",
                    "isActive": true
                },
                {
                    "id": "02",
                    "name": "Beta",
                    "task": "Scanning",
                    "battery": 0.65,
                    "health": 0.8,
                    "color": "#00D9FF",
                    "isActive": true
                },
                {
                    "id": "03",
                    "name": "Gamma",
                    "task": "Maintenance",
                    "battery": 0.30,
                    "health": 0.4,
                    "color": "#FF9500",
                    "isActive": false
                },
                {
                    "id": "04",
                    "name": "Delta",
                    "task": "Idle",
                    "battery": 0.88,
                    "health": 0.9,
                    "color": "#0AF181",
                    "isActive": true
                },
                {
                    "id": "05",
                    "name": "Epsilon",
                    "task": "Critical Error",
                    "battery": 0.10,
                    "health": 0.1,
                    "color": "#D22630",
                    "isActive": false
                },
                {
                    "id": "06",
                    "name": "Zeta",
                    "task": "Charging",
                    "battery": 0.15,
                    "health": 0.6,
                    "color": "#FFFF00",
                    "isActive": false
                }
            ]
        }
        """
    
}

