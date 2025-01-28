import SwiftUI

struct EditHookView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Bindable var hook: Hook  // Bind to the hook for editing

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Hook Details")) {
                        HStack {
                            Text("Puller Name:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., Rick", text: $hook.pullerName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Tractor Name:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., WhyNot", text: $hook.tractor)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Class Name:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 9500 Pro Farm", text: $hook.pullClass)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Distance:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 300 ft", text: $hook.distance)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Sled:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., Red Rock", text: $hook.sled)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Place:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 1st", text: $hook.place)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                    Section(header: Text("Tractor Details")) {
                        HStack {
                            Text("Tire Pressure:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 25.5 psi", value: $hook.tirePressure, format: .number)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Gear:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 3rd", value: $hook.gear, format: .number)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Front Weight:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 300 lbs", value: $hook.frontWeight, format: .number)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Belly Weight:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 300 lbs", value: $hook.bellyWeight, format: .number)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Back Weight:")
                                .frame(width: 120, alignment: .leading)
                            TextField("e.g., 300 lbs", value: $hook.backWeight, format: .number)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                }
                .navigationTitle("Edit Hook")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            dismiss()  // Dismiss the view when "X" is tapped
                        }) {
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

    private func saveChanges() {
        do {
            try modelContext.save()  // Save changes to the hook
            dismiss()  // Dismiss the view
        } catch {
            print("Failed to save changes: \(error.localizedDescription)")
        }
    }
}
