//
//  BouncingCircleViews.swift
//  PokeApp
//
//  Created by Amaury Caballero on 29/4/24.
//
import SwiftUI


struct BouncingCircle {
    var color: Color
    var diameter: CGFloat
    var position: CGPoint
    var velocity: CGPoint
}

struct BouncingCirclesView: View {
    @State var circles: [BouncingCircle]
    let timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(circles.indices, id: \.self) { index in
                    Circle()
                        .fill(circles[index].color)
                        .frame(width: circles[index].diameter, height: circles[index].diameter)
                        .offset(x: circles[index].position.x - circles[index].diameter / 2, y: circles[index].position.y - circles[index].diameter / 2)
                        .onReceive(timer) { _ in
                            updatePosition(index: index, circleDiameter: circles[index].diameter, geometry: geometry)
                        }
                }
            }
            .ignoresSafeArea()
            .blur(radius: 100)
        }
        .background(Color.clear)
    }
    
    func updatePosition(index: Int, circleDiameter: CGFloat, geometry: GeometryProxy) {
        let maxX = geometry.size.width - circleDiameter
        let maxY = geometry.size.height - circleDiameter
        
        circles[index].position.x += circles[index].velocity.x
        circles[index].position.y += circles[index].velocity.y
        
        if circles[index].position.x <= 0 || circles[index].position.x >= maxX {
            circles[index].velocity.x = -circles[index].velocity.x
        }
        if circles[index].position.y <= 0 || circles[index].position.y >= maxY {
            circles[index].velocity.y = -circles[index].velocity.y
        }
    }
}

