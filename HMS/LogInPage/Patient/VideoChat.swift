import SwiftUI

struct VideoChatView: View {
    @State private var selectedDate: String? = nil
    @State private var selectedTime: String? = nil
    @State private var treatment: String? = nil
    @State private var doctor: String? = nil
    @State private var showingAlert = false
    @State private var priority: String? = nil
    @State private var symptomsDescription = ""
    @State private var navigateToCheckups = false

    let dates = ["Mon 03", "Tue 04", "Wed 05", "Thu 06"]
    let times = ["08:00 am", "09:00 am", "10:00 am"]
    let treatments = ["Treatment 1", "Treatment 2", "Treatment 3"]
    let doctors = ["Doctor A", "Doctor B", "Doctor C"]
    let priorities = ["Low", "Medium", "High"]

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Form {
                    Section {
                        HStack {
                            Text("Treatment")
                            Spacer()
                            Menu {
                                ForEach(treatments, id: \.self) { treatment in
                                    Button(action: {
                                        self.treatment = treatment
                                    }) {
                                        Text(treatment)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(treatment ?? "Not Selected")
                                        .foregroundColor(.green)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.green)
                                }
                            }
                        }

                        HStack {
                            Text("Doctor")
                            Spacer()
                            Menu {
                                ForEach(doctors, id: \.self) { doctor in
                                    Button(action: {
                                        self.doctor = doctor
                                    }) {
                                        Text(doctor)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(doctor ?? "Not Selected")
                                        .foregroundColor(.green)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.green)
                                }
                            }
                        }

                        HStack {
                            Text("Priority")
                            Spacer()
                            Menu {
                                ForEach(priorities, id: \.self) { priority in
                                    Button(action: {
                                        self.priority = priority
                                    }) {
                                        Text(priority)
                                    }
                                }
                            } label: {
                                HStack {
                                    Text(priority ?? "Not Selected")
                                        .foregroundColor(.green)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.green)
                                }
                            }
                        }

                        Text("Priority patients are charged extra")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    Section(header: Text("Symptoms description")) {
                        TextField("What is problem you are facing?", text: $symptomsDescription)
                    }

                    Section(header: Text("Schedule")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(dates, id: \.self) { date in
                                    Button(action: {
                                        selectedDate = date
                                    }) {
                                        VStack {
                                            Text(date.split(separator: " ")[0])
                                                .font(.headline)
                                                .foregroundColor(selectedDate == date ? .white : .black)
                                            Text(date.split(separator: " ")[1])
                                                .font(.subheadline)
                                                .foregroundColor(selectedDate == date ? .white : .black)
                                        }
                                        .frame(width: 77, height: 77)
                                        .background(selectedDate == date ? Color.green : Color.white)
                                        .cornerRadius(8)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                        )
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                    }

                    Section(header: Text("Choose time")) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                ForEach(times, id: \.self) { time in
                                    Button(action: {
                                        selectedTime = time
                                    }) {
                                        Text(time)
                                            .padding()
                                            .background(selectedTime == time ? Color.green : Color.white)
                                            .cornerRadius(35)
                                            .foregroundColor(selectedTime == time ? .white : .black)
                                    }
                                }
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                }

                Button(action: {
                    showingAlert = true
                    // Handle book an appointment action
                }) {
                    Text("Book an appointment")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Appointment Booked"),
                        message: Text("You can view your appointment In Check-ups"),
                        primaryButton: .default(Text("View")) {
                            navigateToCheckups = true
                        },
                        secondaryButton: .cancel(Text("Close"))
                    )
                }

                .navigationDestination(isPresented: $navigateToCheckups) {
                    CheckUpsView()
                }
            }
            .navigationBarTitle("Video Chat")
        }
    }
}

struct VideoChatView_Previews: PreviewProvider {
    static var previews: some View {
        VideoChatView()
    }
}