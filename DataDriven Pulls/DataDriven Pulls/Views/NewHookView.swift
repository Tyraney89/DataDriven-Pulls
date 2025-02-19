import SwiftUI

struct NewHookView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    // Core Hook Details (Required)
    @State private var puller: String = ""
    @State private var tractor: String = ""
    @State private var distance: String = ""
    @State private var sled: String = ""
    @State private var tclass: String = ""
    @State private var place: String = ""
    @State private var tirePressure: String = ""

    // Custom categories
    @State private var customCategories: [String: String] = [:]
    @State private var newCategoryName: String = ""
    @State private var newCategoryValue: String = ""

    var pull: Pull

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Hook Details")) {
                        TextField("Puller Name (e.g., Rick)", text: $puller)
                        TextField("Tractor Name (e.g., WhyNot)", text: $tractor)
                        TextField("Class Name (e.g., 9500 Pro Farm)", text: $tclass)
                        TextField("Distance (e.g., 300 ft)", text: $distance)
                            .keyboardType(.decimalPad)
                        TextField("Sled (e.g., Red Rock)", text: $sled)
                        TextField("Place (e.g, 1st)", text: $place)
                            .keyboardType(.decimalPad)
                        TextField("Tire Pressure (e.g., 25.5 psi)", text: $tirePressure)
                            .keyboardType(.decimalPad)
                    }

                    // Section for custom categories
                    Section(header: Text("Custom Categories")) {
                        ForEach(Array(customCategories.keys), id: \.self) { key in
                            HStack {
                                Text(key)
                                Spacer()
                                TextField("Value", text: Binding(
                                    get: { customCategories[key] ?? "" },
                                    set: { customCategories[key] = $0 }
                                ))
                                .multilineTextAlignment(.trailing)
                            }
                        }

                        HStack {
                            TextField("Category Name", text: $newCategoryName)
                            TextField("Value", text: $newCategoryValue)
                            Button(action: addCustomCategory) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .navigationTitle("Record a New Hook")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                                .padding()
                        }
                    }
                }
                .accentColor(Color("PullingColor"))

                Button(action: saveHook) {
                    Text("Save Hook")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("PullingColor"))
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    // Function to add a custom category
    private func addCustomCategory() {
        guard !newCategoryName.isEmpty else { return }
        customCategories[newCategoryName] = newCategoryValue
        newCategoryName = ""
        newCategoryValue = ""
    }

    private func saveHook() {
        // Convert tire pressure to a float
        guard let tirePressureFloat = Float(tirePressure) else { return }

        // Create a new hook with required fields
        let newHook = Hook(
            pull: pull,
            pullerName: puller,
            pullClass: tclass,
            tractor: tractor,
            place: place,
            distance: distance,
            sled: sled,
            tirePressure: tirePressureFloat,
            customCategories: customCategories
        )

        // Save the new hook
        modelContext.insert(newHook)
        do {
            try modelContext.save()
            pull.hooks.append(newHook)  // Update the pull's hooks with the new hook
            dismiss()
        } catch {
            print("Failed to save the hook: \(error)")
        }
    }
}
