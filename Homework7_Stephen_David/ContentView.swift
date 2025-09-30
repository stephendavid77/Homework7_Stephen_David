//
// Assignment #7
// Full Name: Stephen David
// Date: September 29, 2025
//

import SwiftUI

// Custom alignment so we can line up views across different VStacks
extension VerticalAlignment {
    
    // This tells SwiftUI how to align things for our custom alignment
    private enum NameBioAlignment: AlignmentID {
        // Use the top edge of the view for alignment
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.top]
        }
    }
    
    // Our new vertical alignment option
    static let nameBio = VerticalAlignment(NameBioAlignment.self)
}


struct ContentView: View {
    var body: some View {
        // HStack holds two columns: name/image on left, bio on right
        // We're using the custom .nameBio alignment
        HStack(alignment: .nameBio) {
            
            // Left column
            VStack {
                Text("Hello, my name is Stephen!")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                // Align this text to the top using our custom guide
                    .alignmentGuide(.nameBio) { d in d[VerticalAlignment.top] }
                
                // Profile image
                Image("profilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .shadow(radius: 10)
            }
            
            // Right column
            VStack(alignment: .leading, spacing: 10) {
                Text("Bio:")
                    .font(.title2)
                    .fontWeight(.bold)
                // Align this text to the top like the name on the left
                    .alignmentGuide(.nameBio) { d in d[VerticalAlignment.top] }
                
                Text("I'm an iOS developer learning SwiftUI. I love solving problems, building apps, and exploring new technologies.")
                
                Text("Hobbies:")
                    .font(.headline)
                    .padding(.top, 10)
                
                Text("• Hiking\n• Photography\n• App development")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
