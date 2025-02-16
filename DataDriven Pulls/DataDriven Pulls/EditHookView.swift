import SwiftUI

struct EditHookView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Bindable var hook: Hook  // Bind to the hook for editing

    // New category inputs
    @State private var newCategoryName: String = ""
    @State private var newCategoryValue: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Hook Details")) {
                        fieldRow(label: "Puller Name:", text: $hook.pullerName)
                        fieldRow(label: "Tractor Name:", text: $hook.tractor)
                        fieldRow(label: "Class Name:", text: $hook.pullClass)
                        fieldRow(label: "Distance:", text: $hook.distance, keyboardType: .decimalPad)
                        fieldRow(label: "Sled:", text: $hook.sled)
                        fieldRow(label: "Place:", text: $hook.place)
                        fieldRow(label: "Tire Pressure:", value: $hook.tirePressure)
                    }

                    Section(header: Text("Custom Categories")) {
                        ForEach(Array(hook.customCategories.keys), id: \.self) { key in
                            HStack {
                                Text(key)
                                    .frame(width: 120, alignment: .leading)
                                TextField("Value", text: Binding(
                                    get: { hook.customCategories[key] ?? "" },
                                    set: { hook.customCategories[key] = $0 }
                                ))
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                        }

                        // Add new custom category
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
                .navigationTitle("Edit Hook")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { dismiss() }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.primary)
                        }
                    }
                }
                .accentColor(Color("PullingColor"))

                Button(action: saveChanges) {
                    Text("Save Changes")
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

    private func addCustomCategory() {
        guard !newCategoryName.isEmpty else { return }
        hook.customCategories[newCategoryName] = newCategoryValue
        newCategoryName = ""
        newCategoryValue = ""
    }

    private func saveChanges() {
        do {
            try modelContext.save()  // Save changes to the hook
            dismiss()  // Dismiss the view
        } catch {
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }

    // Helper function to create text fields with labels
    private func fieldRow(label: String, text: Binding<String>, keyboardType: UIKeyboardType = .default) -> some View {
        HStack {
            Text(label)
                .frame(width: 120, alignment: .leading)
            TextField("e.g., \(label)", text: text)
                .keyboardType(keyboardType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }

    private func fieldRow(label: String, value: Binding<Float>, keyboardType: UIKeyboardType = .decimalPad) -> some View {
        HStack {
            Text(label)
                .frame(width: 120, alignment: .leading)
            TextField("e.g., \(label)", value: value, format: .number)
                .keyboardType(keyboardType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
