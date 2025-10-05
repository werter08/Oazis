//
//  CustomAnimatedCircle.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

struct CustomAnimatedBorderCircle: View {
    
    var color: Color
    var size: CGFloat = 64
    var borderWidth: CGFloat = 4.0 // Define a constant border width
    
    // State properties to control the animation values
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 0.0
    
    // The duration of one animation cycle
    private let animationDuration: Double = 3.0
    
    var body: some View {
        ZStack {
            
            // 1. The Animated Border (Grows, brightens, and maintains line width)
            Circle()
                // 👇 This creates the border that will animate
                .stroke(color, lineWidth: borderWidth)
                .frame(width: size, height: size)
                // Use opacity for brightness and scale for size
                .opacity(opacity)
                .scaleEffect(scale)

            // 2. The Base Circle (The main, static, filled object)
            Circle()
                .frame(width: size, height: size)
                .foregroundStyle(color)
                .overlay(
                    // Optional: Add a subtle static border to the base for definition
                    Circle()
                        .stroke(Color.black.opacity(0.1), lineWidth: 1)
                        .frame(width: size, height: size)
                )
        }
        .onAppear {
            startRepeatingAnimation()
        }
    }
    
    // MARK: - Animation Logic
    
    private func startRepeatingAnimation() {
        
        Task {
            // Loop indefinitely
            while true {
                // 1. Reset the state: Small initial scale, near-full opacity (bright)
                scale = 1.0
                opacity = 1.0 // Start at full brightness
                
                // 2. Animate the border growing larger and fading out.
                // The animation lasts for 5 seconds.
                try await Task.sleep(for: .milliseconds(50)) // Small delay for reset
                
                withAnimation(.linear(duration: animationDuration)) {
                    scale = 1.4 // Border grows significantly larger
                    opacity = 0.0 // Border fades to transparent (darkens/disappears)
                }
                
                // 3. Wait for the animation to finish before repeating
                try await Task.sleep(for: .seconds(animationDuration))
            }
        }
    }
}



#Preview {
    CustomAnimatedBorderCircle(color: .teal)
}

import SwiftUI
import Combine // Import Combine to use the Timer class

struct CustomAnimatedCircle: View {
    
    var color: Color
    var size: CGFloat = 64
    var animationDuration: Double = 5.0 // The total cycle time
    
    // State properties to control the animation values
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    
    // Timer properties
    @State private var startTime: Date?
    @State private var timerSubscription: AnyCancellable?
    
    private let targetScale: CGFloat = 2.0
    
    var body: some View {
        ZStack {
            
            // 1. The Animated Border (Grows and Fades)
            Circle()
                .frame(width: size, height: size)
                .foregroundStyle(color)
                .opacity(opacity)
                .scaleEffect(scale)
            
            // 2. The Base Circle (The main, static object)
            Circle()
                .frame(width: size, height: size)
                .foregroundStyle(color)
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    // MARK: - Manual Timer Logic
    
    private func startTimer() {
        // Stop any existing timer
        stopTimer()
        
        // Record the start time
        startTime = Date()
        
        // 1. Create and subscribe to a repeating timer (e.g., updates 60 times per second)
        timerSubscription = Timer.publish(every: 1.0 / 60.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                // 2. Calculate the animation state on every tick
                updateAnimationState()
            }
    }
    
    private func stopTimer() {
        timerSubscription?.cancel()
        timerSubscription = nil
    }
    
    private func updateAnimationState() {
        guard let start = startTime else { return }
        
        let elapsed = Date().timeIntervalSince(start)
        
        // 3. Calculate the percentage completed for the current cycle
        // The modulus operator (%) makes the animation loop
        let percentage = fmod(elapsed, animationDuration) / animationDuration
        
        // 4. Update Scale (Linear interpolation from 1.0 to targetScale)
        // new_scale = start_scale + (end_scale - start_scale) * percentage
        scale = 1.0 + (targetScale - 1.0) * percentage
        
        // 5. Update Opacity (Linear interpolation from 1.0 to 0.0)
        // new_opacity = start_opacity + (end_opacity - start_opacity) * percentage
        opacity = 1.0 - percentage
        
        // 6. Manual Reset Logic (Alternative to fmod, ensures the timer knows when a cycle ends)
        if elapsed >= animationDuration {
            // Restart the cycle by resetting the start time
            startTime = Date()
        }
    }
}
