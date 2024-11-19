import SwiftUI

struct NightLogViewController: View {
    @State private var selectedSkinType: String?
    @State private var skinAppearance: String?
    @State private var dietImpact: [String] = []
    @State private var environmentImpact: String?
    @State private var planningToSleepEarly: String?
    @State private var waterIntake: String = ""
    @State private var outdoorExposure: String = ""
    @State private var satisfactionLevel: Double = 0.5

    let buttonColor = Color(hex: "F28D86")

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // Title
                Text("Night Log")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)

                // Skin Type Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("How does your skin feel throughout the day?")
                        .font(.headline)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                        ForEach(["Normal", "Dry", "Oily", "Combination"], id: \.self) { type in
                            NightLogSelectionButton(title: type, isSelected: selectedSkinType == type) {
                                selectedSkinType = type
                            }
                        }
                    }
                }

                // Skin Appearance Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("How would you describe your skin’s overall appearance tonight?")
                        .font(.headline)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                        ForEach(["Glowing", "Dull", "Inflamed", "Healthy"], id: \.self) { appearance in
                            NightLogSelectionButton(title: appearance, isSelected: skinAppearance == appearance) {
                                skinAppearance = appearance
                            }
                        }
                    }
                }

                // Water Intake
                VStack(alignment: .leading, spacing: 20) {
                    Text("How much water did you drink today?")
                        .font(.headline)
                    TextField("Type your answer...", text: $waterIntake)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(buttonColor, lineWidth: 1)
                        )
                }

                // Diet Impact Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Did your diet today include anything that might impact your skin?")
                        .font(.headline)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                        ForEach(["Sugar", "Caffeine", "Dairy", "Processed"], id: \.self) { item in
                            NightLogSelectionButton(title: item, isSelected: dietImpact.contains(item)) {
                                if dietImpact.contains(item) {
                                    dietImpact.removeAll(where: { $0 == item })
                                } else {
                                    dietImpact.append(item)
                                }
                            }
                        }
                    }
                }

                // Outdoor Exposure
                VStack(alignment: .leading, spacing: 20) {
                    Text("How much time did you spend outdoors or exposed to the sun?")
                        .font(.headline)
                    TextField("Type your answer...", text: $outdoorExposure)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(buttonColor, lineWidth: 1)
                        )
                }

                // Environmental Impact Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("How would you describe your skin’s overall appearance tonight?")
                        .font(.headline)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), spacing: 15) {
                        ForEach(["Pollution", "Humidity", "Air conditioning", "Heat"], id: \.self) { impact in
                            NightLogSelectionButton(title: impact, isSelected: environmentImpact == impact) {
                                environmentImpact = impact
                            }
                        }
                    }
                }

                // Sleep Early Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Are you planning to sleep early tonight?")
                        .font(.headline)
                    HStack(spacing: 15) {
                        ForEach(["Yes", "No"], id: \.self) { response in
                            NightLogSelectionButton(title: response, isSelected: planningToSleepEarly == response) {
                                planningToSleepEarly = response
                            }
                        }
                    }
                }

                // Satisfaction Slider
                VStack(alignment: .leading, spacing: 20) {
                    Text("How satisfied are you with your skin today?")
                        .font(.headline)
                    Slider(value: $satisfactionLevel, in: 0...1)
                        .accentColor(buttonColor)
                        .padding(.horizontal)
                }
            }
            .padding()
        }
        .navigationTitle("Night Log")
    }
}

struct NightLogSelectionButton: View {
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
// Helper to create Color from Hex
extension Color {
    init(hexString: String) {
        let scanner = Scanner(string: hexString)
        scanner.currentIndex = hexString.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}


// Preview
struct NightLogViewController_Previews: PreviewProvider {
    static var previews: some View {
        NightLogViewController()
    }
}
