//
//  ContentView.swift
//  Instafilter
//
//  Created by Thomas Williams on 4/4/24.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.crystallize()
        
        currentFilter.inputImage = beginImage
        currentFilter.radius = 200
        
        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        // attempt to get a CGImage from our CIImage
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        
        // convert that to a UIImage
        let uiImage = UIImage(cgImage: cgImage)
        
        // and convert that to a SwiftUI image
        image = Image(uiImage: uiImage)
        
        
    }
}

#Preview {
    ContentView()
}
