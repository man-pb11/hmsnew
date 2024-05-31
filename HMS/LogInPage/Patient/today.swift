import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            TodayView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Today")
                }
            
            CheckUpsView()
                .tabItem {
                    Image(systemName: "stethoscope")
                    Text("Check-Up")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
        }
    }
}
struct TodayView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Today")
                            .font(.largeTitle)
                            .bold()
                        
                        Text(currentDate())
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.top)
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            Button(action: {
                                // Action for SOS button
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 24, height: 24)
                                    Text("SOS")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                            }
                            Button(action: {
                                // Action for notification button
                            }) {
                                Image(systemName: "bell")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    SearchBar()
                        .padding(.horizontal)

                    
                    HStack(spacing: 16) {
                        NavigationLink(destination: ClinicView()) {
                            ServiceButton(title: "Clinic Visit", subtitle: "Make an appointment", color: .green, iconName: "plus.circle.fill")
                                .frame(width: 180, height: 130)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: VideoChatView()) {
                            ServiceButton(title: "Video Chat", subtitle: "Video Call with doctor", color: .green, iconName: "video.circle.fill")
                                .frame(width: 180, height: 130)
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("Treatments")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    FeaturedServicesGrid()
                        
                        .padding(.top, 1) // Reduced space between text and grid
                    
                    Text("Articles")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    BestOffersView()
                        
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        return formatter.string(from: Date())
    }

}


struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search symptoms / specialities", text: $searchText)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
    }
}

struct ServiceButton: View {
    let title: String
    let subtitle: String
    let color: Color
    let iconName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(systemName: iconName)
                .foregroundColor(.white)
                .font(.title) // Adjust icon size if needed
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
        .frame(maxWidth: .infinity)
    }
}

struct FeaturedServicesGrid: View {
    let services = [
        "General Physician", "Skin & Hair", "Women's Health",
        "Dental Care", "Child Specialist", "Ear, Nose, Throat",
        "Mental Wellness", "More", "Physiotherapy", "Nutritionist"
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(services, id: \.self) { service in
                NavigationLink(destination: DoctorListView(serviceName: service)) {
                    ServiceIcon(name: service)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ServiceIcon: View {
    let name: String
    
    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.black)
                .frame(height: 60)
            
            Text(name)
                .font(.caption)
                .foregroundColor(.black) // Set text color to black
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, minHeight: 40)
                .padding(.top, 0) // Remove spacing between rectangle and text
        }
        .frame(height: 100)
        .background(Color(.white))
        .cornerRadius(10)
    }
}

struct BestOffersView: View {
    let offers = [
        Offer(title: "Discount on Medicines", color: .green),
        Offer(title: "Free Health Checkup", color: .blue),
        Offer(title: "50% off on Dental Care", color: .purple),
        // Add more offers as needed
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(offers) { offer in
                    OfferCard(offer: offer)
                        .frame(width: 200, height: 100) // Adjust size as needed
                }
            }
            .padding(.horizontal)
        }
    }
}

struct Offer: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
}

struct OfferCard: View {
    let offer: Offer
    
    var body: some View {
        VStack {
            Text(offer.title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(offer.color)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
