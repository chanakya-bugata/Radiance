import SwiftUI

struct MorningLogViewController: View {
    @State private var selectedSkinType: String?
    @State private var breakoutResponse: String?
    @State private var selectedRestLevel: String?
    @State private var sleepHours: Int = 8
    @State private var progressText: String = ""
    @State private var happinessLevel: Double = 0.5
    
    let buttonColor = Color(hex: "F28D86")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Title
                Text("Morning Log")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                
                // Skin Type Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("How does your skin feel this morning?")
                        .font(.headline)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                        ForEach(["Normal", "Dry", "Oily", "Combination"], id: \.self) { type in
                            SelectionButton(title: type, isSelected: selectedSkinType == type) {
                                selectedSkinType = type
                            }
                        }
                    }
                }
                
                // Breakouts Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Did you notice any new breakouts or blemishes today?")
                        .font(.headline)
                    HStack(spacing: 15) {
                        ForEach(["Yes", "No"], id: \.self) { response in
                            SelectionButton(title: response, isSelected: breakoutResponse == response) {
                                breakoutResponse = response
                            }
                        }
                    }
                }
                
                // Sleep Hours Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("How many hours of sleep did you get last night?")
                        .font(.headline)
                    Picker("Hours", selection: $sleepHours) {
                        ForEach(0..<25) { hour in
                            Text("\(hour)")
                                .tag(hour)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 120) // Compact the picker height
                }
                
                // Rest Level Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("How well-rested do you feel this morning?")
                        .font(.headline)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                        ForEach(["Good", "Bad", "Neutral", "Energised"], id: \.self) { level in
                            SelectionButton(title: level, isSelected: selectedRestLevel == level) {
                                selectedRestLevel = level
                            }
                        }
                    }
                }
                
                // Progress Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Did you notice any progress in the areas you’re targeting?")
                        .font(.headline)
                    TextField("Type your answer...", text: $progressText)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(buttonColor, lineWidth: 1)
                        )
                }
                
                // Happiness Level Slider
                VStack(alignment: .leading, spacing: 20) {
                    Text("How happy are you with your skin today?")
                        .font(.headline)
                    Slider(value: $happinessLevel, in: 0...1)
                        .accentColor(buttonColor)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
        .navigationTitle("Morning Log")
    }
}

struct SelectionButton: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color(hex: "F28D86") : Color.white)
                .foregroundColor(isSelected ? .white : Color(hex: "F28D86"))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: "F28D86"), lineWidth: 1)
                )
        }
    }
}

// Helper to create Color from Hex
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

// Preview
struct MorningLogViewController_Previews: PreviewProvider {
    static var previews: some View {
        MorningLogViewController()
    }
}
