//
//  ClosedShape.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 07/08/14.
//  Copyright (c) 2014 Luiz Fernando Silva. All rights reserved.
//

import CoreGraphics

/// Contains a set of points that is equivalent as the internal shape of a sofy body
public class ClosedShape
{
    public final var localVertices: [Vector2] = [];
    
    /// Start adding vertices to this closed shape.
    /// Calling this method will erase any existing verts
    public func begin()
    {
        localVertices = [];
    }
    
    /// Adds a vertex to this closed shape
    public func addVertex(vertex: Vector2)
    {
        localVertices += vertex;
    }
    
    /// Adds a vertex to this closed shape
    public func addVertex(#x: CGFloat, y: CGFloat)
    {
        addVertex(Vector2(x, y));
    }
    
    /// Finishes constructing this closed shape, and convert them to local space (by default)
    public func finish(recenter: Bool = true)
    {
        if(recenter)
        {
            // Find the average location of all the vertices
            var center = averageVectors(localVertices);
            
            localVertices = localVertices.map { $0 - center };
        }
    }
    
    /// Transforms all vertices by the given angle and scale
    public func transformOwn(angleInRadians: CGFloat, localScale: Vector2)
    {
        localVertices = localVertices.map { rotateVector($0 * localScale, angleInRadians) };
    }
    
    /// Gets a new list of vertices, transformed by the given position, angle, and scale.
    /// transformation is applied in the following order:  scale -> rotation -> position.
    public func transformVertices(worldPos: Vector2, angleInRadians: CGFloat, localScale: Vector2 = Vector2.One) -> [Vector2]
    {
        return localVertices.map { rotateVector($0 * localScale, angleInRadians) + worldPos };
    }
    
    /// Transforms the points on this closed shape into the given array of points.
    /// The array of points must have the same count of vertices as this closed shape
    /// transformation is applied in the following order:  scale -> rotation -> position.
    public func transformVertices(inout target:[Vector2], worldPos: Vector2, angleInRadians: CGFloat, localScale: Vector2 = Vector2.One)
    {
        for (i, l) in enumerate(localVertices)
        {
            target[i] = rotateVector(l * localScale, angleInRadians) + worldPos;
        }
    }
}