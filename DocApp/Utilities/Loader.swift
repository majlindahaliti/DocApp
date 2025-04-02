//
//  Loader.swift
//  DocApp
//
//  Created by Majlinda on 2.4.25.
//

import UIKit
import Lottie

class LottieLoader {
    static let shared = LottieLoader()
    
    private var animationView: LottieAnimationView?
    private var containerView: UIView?
    
    private init() {}

    func showLoader() {
        guard let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) else { return }
        
        containerView = UIView(frame: window.bounds)
        
        animationView = LottieAnimationView(name: "loader")
        animationView?.contentMode = .scaleAspectFill
        animationView?.loopMode = .loop
        
        if let animationView = animationView {
            animationView.translatesAutoresizingMaskIntoConstraints = false
            containerView?.addSubview(animationView)

            NSLayoutConstraint.activate([
                animationView.centerXAnchor.constraint(equalTo: containerView!.centerXAnchor),
                animationView.centerYAnchor.constraint(equalTo: containerView!.centerYAnchor),
                animationView.widthAnchor.constraint(equalToConstant: 80),
                animationView.heightAnchor.constraint(equalToConstant: 80)
            ])
        }
        
        if let containerView = containerView {
            window.addSubview(containerView)
            animationView?.play()
        }
    }
    
    func hideLoader() {
        animationView?.stop()
        containerView?.removeFromSuperview()
        containerView = nil
        animationView = nil
    }
}
