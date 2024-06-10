//
//  LottieIntresepter.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 06.06.2024.
//

import Foundation

protocol LottieInteractorInput: AnyObject {}

protocol LottieInteractorOutput: AnyObject {}

final class LottieInteractor {
    weak var output: LottieInteractorOutput?
}

extension LottieInteractor: LottieInteractorInput {}
