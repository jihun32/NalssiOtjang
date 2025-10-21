//
//  File.swift
//  RecordPhoto
//
//  Created by 정지훈 on 9/22/25.
//

import CoreRouterInterface
import Foundation

public enum RecordPhotoRoute: Route {
    case classifyPhoto(imageData: Data)
    case choiceClothesIcon
    case recordPhoto
}
