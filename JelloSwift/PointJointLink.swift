//
//  BodyJointLinks.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 06/03/15.
//  Copyright (c) 2015 Luiz Fernando Silva. All rights reserved.
//

import Foundation
import CoreGraphics

/// Represents a joint link that links directly to a point mass of a body
class PointJointLink: JointLinkType
{
    // This is a very straightforward implementation, it basically delegates the calls to the underlying point mass
    
    /// The body that this joint link is linked to
    private var _body: Body;
    
    /// The point mass this joint is linked to
    private var _pointMass: PointMass;
    
    /// Gets the body that this joint link is linked to
    var body: Body { return _body; }
    
    /// Gets the type of joint this joint link represents
    var linkType: LinkType { return LinkType.Point }
    
    /// Gets the position, in world coordinates, at which this joint links with the underlying body
    var position: Vector2
    {
        return _pointMass.position;
    }
    
    /// Gets the velocity of the object this joint links to
    var velocity: Vector2
    {
        return _pointMass.velocity;
    }
    
    /// Gets the total mass of the subject of this joint link
    var mass: CGFloat
    {
        return _pointMass.mass;
    }
    
    /// Gets a value specifying whether the object referenced by this JointLinkType is static
    var isStatic: Bool
    {
        return isinf(_pointMass.mass);
    }
    
    /// Inits a new point joint link with the specified parameters
    init(body: Body, pointMassIndex: Int)
    {
        _body = body;
        _pointMass = _body.pointMasses[pointMassIndex];
    }
    
    /// Appies a given force to the subject of this joint link
    ///
    /// :param: force A force to apply to the subjects of this joint link
    func applyForce(force: Vector2)
    {
        _pointMass.applyForce(force);
    }
}