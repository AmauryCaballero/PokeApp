//
//  PokeBallShape.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

struct PokeBallShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: 0.00884*width, y: 0.12965*height))
        path.addCurve(to: CGPoint(x: -0.33058*width, y: 0.34919*height), control1: CGPoint(x: -0.15069*width, y: 0.16998*height), control2: CGPoint(x: -0.27308*width, y: 0.2492*height))
        path.addCurve(to: CGPoint(x: -0.35999*width, y: 0.47509*height), control1: CGPoint(x: -0.35064*width, y: 0.38431*height), control2: CGPoint(x: -0.3626*width, y: 0.43536*height))
        path.addCurve(to: CGPoint(x: -0.34245*width, y: 0.54506*height), control1: CGPoint(x: -0.35843*width, y: 0.50094*height), control2: CGPoint(x: -0.34716*width, y: 0.54579*height))
        path.addCurve(to: CGPoint(x: -0.31987*width, y: 0.53483*height), control1: CGPoint(x: -0.34141*width, y: 0.5449*height), control2: CGPoint(x: -0.33112*width, y: 0.54035*height))
        path.addCurve(to: CGPoint(x: 0.0192*width, y: 0.41195*height), control1: CGPoint(x: -0.22743*width, y: 0.48976*height), control2: CGPoint(x: -0.09013*width, y: 0.44012*height))
        path.addCurve(to: CGPoint(x: 0.05672*width, y: 0.40207*height), control1: CGPoint(x: 0.03728*width, y: 0.40736*height), control2: CGPoint(x: 0.05405*width, y: 0.40297*height))
        path.addCurve(to: CGPoint(x: 0.06287*width, y: 0.39254*height), control1: CGPoint(x: 0.05992*width, y: 0.40108*height), control2: CGPoint(x: 0.0621*width, y: 0.39778*height))
        path.addCurve(to: CGPoint(x: 0.15215*width, y: 0.3065*height), control1: CGPoint(x: 0.06759*width, y: 0.36126*height), control2: CGPoint(x: 0.10525*width, y: 0.32493*height))
        path.addCurve(to: CGPoint(x: 0.42182*width, y: 0.3297*height), control1: CGPoint(x: 0.23872*width, y: 0.27225*height), control2: CGPoint(x: 0.35476*width, y: 0.28235*height))
        path.addCurve(to: CGPoint(x: 0.45101*width, y: 0.34157*height), control1: CGPoint(x: 0.4393*width, y: 0.34221*height), control2: CGPoint(x: 0.43956*width, y: 0.34217*height))
        path.addCurve(to: CGPoint(x: 0.82199*width, y: 0.34444*height), control1: CGPoint(x: 0.57931*width, y: 0.33378*height), control2: CGPoint(x: 0.70137*width, y: 0.3347*height))
        path.addCurve(to: CGPoint(x: 0.81037*width, y: 0.32046*height), control1: CGPoint(x: 0.82665*width, y: 0.34488*height), control2: CGPoint(x: 0.82448*width, y: 0.33993*height))
        path.addCurve(to: CGPoint(x: 0.62035*width, y: 0.17521*height), control1: CGPoint(x: 0.76984*width, y: 0.26359*height), control2: CGPoint(x: 0.69994*width, y: 0.2104*height))
        path.addCurve(to: CGPoint(x: 0.18291*width, y: 0.10277*height), control1: CGPoint(x: 0.48985*width, y: 0.11745*height), control2: CGPoint(x: 0.34006*width, y: 0.0927*height))
        path.addCurve(to: CGPoint(x: 0.00884*width, y: 0.12965*height), control1: CGPoint(x: 0.13454*width, y: 0.10574*height), control2: CGPoint(x: 0.05329*width, y: 0.11837*height))
        path.closeSubpath()
        
        path.move(to: CGPoint(x: 0.20093*width, y: 0.34906*height))
        path.addCurve(to: CGPoint(x: 0.14826*width, y: 0.40784*height), control1: CGPoint(x: 0.16771*width, y: 0.36241*height), control2: CGPoint(x: 0.14844*width, y: 0.38403*height))
        path.addCurve(to: CGPoint(x: 0.24555*width, y: 0.47516*height), control1: CGPoint(x: 0.14762*width, y: 0.44014*height), control2: CGPoint(x: 0.18919*width, y: 0.46878*height))
        path.addCurve(to: CGPoint(x: 0.29453*width, y: 0.47293*height), control1: CGPoint(x: 0.26432*width, y: 0.47723*height), control2: CGPoint(x: 0.26733*width, y: 0.4771*height))
        path.addCurve(to: CGPoint(x: 0.34058*width, y: 0.45959*height), control1: CGPoint(x: 0.3225*width, y: 0.46864*height), control2: CGPoint(x: 0.32374*width, y: 0.46828*height))
        path.addCurve(to: CGPoint(x: 0.38184*width, y: 0.40025*height), control1: CGPoint(x: 0.37004*width, y: 0.44466*height), control2: CGPoint(x: 0.38512*width, y: 0.42303*height))
        path.addCurve(to: CGPoint(x: 0.28844*width, y: 0.33927*height), control1: CGPoint(x: 0.37774*width, y: 0.37115*height), control2: CGPoint(x: 0.33912*width, y: 0.34602*height))
        path.addCurve(to: CGPoint(x: 0.24037*width, y: 0.34037*height), control1: CGPoint(x: 0.26954*width, y: 0.33688*height), control2: CGPoint(x: 0.2662*width, y: 0.3369*height))
        path.addCurve(to: CGPoint(x: 0.20093*width, y: 0.34906*height), control1: CGPoint(x: 0.21879*width, y: 0.34334*height), control2: CGPoint(x: 0.21018*width, y: 0.34533*height))
        path.closeSubpath()
        
        path.move(to: CGPoint(x: 0.05564*width, y: 0.48497*height))
        path.addCurve(to: CGPoint(x: -0.26867*width, y: 0.60839*height), control1: CGPoint(x: -0.06148*width, y: 0.51698*height), control2: CGPoint(x: -0.17484*width, y: 0.56014*height))
        path.addCurve(to: CGPoint(x: -0.29656*width, y: 0.62308*height), control1: CGPoint(x: -0.28369*width, y: 0.61615*height), control2: CGPoint(x: -0.29611*width, y: 0.62284*height))
        path.addCurve(to: CGPoint(x: -0.2837*width, y: 0.63778*height), control1: CGPoint(x: -0.29695*width, y: 0.62347*height), control2: CGPoint(x: -0.29129*width, y: 0.63003*height))
        path.addCurve(to: CGPoint(x: 0.10937*width, y: 0.81216*height), control1: CGPoint(x: -0.19863*width, y: 0.72564*height), control2: CGPoint(x: -0.0583*width, y: 0.78801*height))
        path.addCurve(to: CGPoint(x: 0.31775*width, y: 0.81966*height), control1: CGPoint(x: 0.17253*width, y: 0.82129*height), control2: CGPoint(x: 0.24909*width, y: 0.82408*height))
        path.addCurve(to: CGPoint(x: 0.48378*width, y: 0.79418*height), control1: CGPoint(x: 0.36226*width, y: 0.81679*height), control2: CGPoint(x: 0.4441*width, y: 0.80423*height))
        path.addCurve(to: CGPoint(x: 0.73893*width, y: 0.67593*height), control1: CGPoint(x: 0.58697*width, y: 0.76794*height), control2: CGPoint(x: 0.67398*width, y: 0.72768*height))
        path.addCurve(to: CGPoint(x: 0.85732*width, y: 0.48435*height), control1: CGPoint(x: 0.80653*width, y: 0.62195*height), control2: CGPoint(x: 0.85018*width, y: 0.55151*height))
        path.addCurve(to: CGPoint(x: 0.85464*width, y: 0.42663*height), control1: CGPoint(x: 0.85961*width, y: 0.46154*height), control2: CGPoint(x: 0.85816*width, y: 0.42956*height))
        path.addCurve(to: CGPoint(x: 0.74437*width, y: 0.41696*height), control1: CGPoint(x: 0.85245*width, y: 0.42482*height), control2: CGPoint(x: 0.79755*width, y: 0.41986*height))
        path.addCurve(to: CGPoint(x: 0.51381*width, y: 0.4155*height), control1: CGPoint(x: 0.67192*width, y: 0.41272*height), control2: CGPoint(x: 0.5914*width, y: 0.41235*height))
        path.addCurve(to: CGPoint(x: 0.46804*width, y: 0.41741*height), control1: CGPoint(x: 0.48912*width, y: 0.41648*height), control2: CGPoint(x: 0.46857*width, y: 0.41733*height))
        path.addCurve(to: CGPoint(x: 0.463*width, y: 0.43073*height), control1: CGPoint(x: 0.46778*width, y: 0.41745*height), control2: CGPoint(x: 0.46538*width, y: 0.42343*height))
        path.addCurve(to: CGPoint(x: 0.36917*width, y: 0.5102*height), control1: CGPoint(x: 0.45253*width, y: 0.46289*height), control2: CGPoint(x: 0.41791*width, y: 0.49215*height))
        path.addCurve(to: CGPoint(x: 0.26925*width, y: 0.52735*height), control1: CGPoint(x: 0.3435*width, y: 0.51975*height), control2: CGPoint(x: 0.29965*width, y: 0.52731*height))
        path.addCurve(to: CGPoint(x: 0.11075*width, y: 0.48593*height), control1: CGPoint(x: 0.208*width, y: 0.52766*height), control2: CGPoint(x: 0.15131*width, y: 0.51291*height))
        path.addCurve(to: CGPoint(x: 0.0916*width, y: 0.47533*height), control1: CGPoint(x: 0.10162*width, y: 0.47974*height), control2: CGPoint(x: 0.0931*width, y: 0.47493*height))
        path.addCurve(to: CGPoint(x: 0.05564*width, y: 0.48497*height), control1: CGPoint(x: 0.09029*width, y: 0.47553*height), control2: CGPoint(x: 0.07411*width, y: 0.47999*height))
        path.closeSubpath()
        return path
    }
}
