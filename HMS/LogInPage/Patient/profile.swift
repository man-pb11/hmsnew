import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Image centered above the list
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .padding()
                }
                .frame(maxWidth: .infinity) // Make sure the image container takes the full width
                .background(Color(UIColor.systemGroupedBackground)) // Match the background with the list's background
                
                // Menu List
                List {
                    Section {
                        NavigationLink(destination: Text("Edit Profile")) {
                            Text("Edit Profile")
                        }
                        NavigationLink(destination: Text("Notifications")) {
                            Text("Notifications")
                        }
                        NavigationLink(destination: Text("Health Details")) {
                            Text("Appointments")
                        }
                    }
                    
                    Section {
                        NavigationLink(destination: Text("My Prescriptions")) {
                            Text("My Prescriptions")
                        }
                        NavigationLink(destination: Text("About us")) {
                            Text("About us")
                        }
                        NavigationLink(destination: Text("Help Centre")) {
                            Text("Help Centre")
                        }
                    }
                    
                    // Logout Button
                    Button(action: {
                        // Handle logout action here
                    }) {
                        HStack {
                            Spacer()
                            Text("Log out")
                                .foregroundColor(.white)
                                .padding()
                            Spacer()
                        }
                        .background(Color.red)
                        .cornerRadius(10)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(InsetGroupedListStyle()) // Apply the InsetGroupedListStyle for rounded borders
            }
            .navigationTitle("Profile") // Set the navigation title here
            .navigationBarHidden(false) // Ensure the navigation bar is not hidden
        }
        .navigationBarBackButtonHidden(false) // Ensure the back button is shown
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
