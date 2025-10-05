//
//  CustomAnimatedCircle.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI
import Combine // Required for the Timer functionality

struct CustomAnimatedBorderCircle: View {
    
    var color: Color
    var size: CGFloat = 64
    var borderWidth: CGFloat = 4.0 // Define a constant border width
    var animationDuration: Double = 3.0 // The total cycle time
    
    // State properties for manual animation control
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0 // Start at 1.0 for the fading effect
    
    // Timer properties
    @State private var startTime: Date?
    @State private var timerSubscription: AnyCancellable?
    
    // Define the maximum scale the pulse should reach
    private let targetScale: CGFloat = 1.4
    
    var body: some View {
        ZStack {
            
            // 1. The Animated Border (Grows, brightens, and maintains line width)
            Circle()
                // 👇 This creates the border that will animate
                .stroke(color, lineWidth: borderWidth)
                .frame(width: size, height: size)
                // Use the manually updated opacity and scale
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
        
        // Record the start time of the cycle
        startTime = Date()
        
        // 1. Create and subscribe to a repeating timer (e.g., updates 60 times per second)
        timerSubscription = Timer.publish(every: 1.0 / 60.0, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                // 2. Update the animation state on every tick
                updateAnimationState()
            }
    }
    
    private func stopTimer() {
        timerSubscription?.cancel()
        timerSubscription = nil
    }
    
    private func updateAnimationState() {
        guard let start = startTime else { return }
        
        // Calculate the elapsed time since the start of the animation
        let elapsed = Date().timeIntervalSince(start)
        
        // Calculate the percentage completed for the current cycle (0.0 to 1.0)
        let percentage = fmod(elapsed, animationDuration) / animationDuration
        
        // 1. Update Scale (Interpolate from 1.0 to 1.4)
        // new_scale = start_scale + (end_scale - start_scale) * percentage
        scale = 1.0 + (targetScale - 1.0) * percentage
        
        // 2. Update Opacity (Interpolate from 1.0 to 0.0)
        // new_opacity = 1.0 - percentage
        opacity = 1.0 - percentage
        
        // 3. Optional: Reset the cycle for perfect timing
        if elapsed >= animationDuration {
            // Restart the cycle by resetting the start time
            startTime = Date()
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
