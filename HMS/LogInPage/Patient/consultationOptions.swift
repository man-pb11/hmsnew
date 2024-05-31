import SwiftUI

struct ConsultationOptionsView: View {
    let doctor: Doctor

    var body: some View {
        VStack(spacing: 24) {
            Text("How would you like to consult\n\(doctor.name)?")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            VStack(spacing: 24) {
                NavigationLink(destination: ClinicView()) {
                    ConsultationOptionCard(iconName: "plus.circle.fill", title: "Book In-Clinic Consultation", subtitle: "Consult with a General physician In-Clinic")
                        .frame(minHeight: 150)
                }

                NavigationLink(destination: VideoChatView()) {
                    ConsultationOptionCard(iconName: "video.circle.fill", title: "Book In-Video Consultation", subtitle: "Consult with a General physician via Video Call")
                        .frame(minHeight: 150)
                }
            }
            .padding(.horizontal, 45) // Increased horizontal padding for the 

            Spacer()
        }

    }
}

struct ConsultationOptionCard: View {
    let iconName: String
    let title: String
    let subtitle: String

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.green)
                .shadow(radius: 5)

            VStack(alignment: .leading, spacing: 0) {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding(16)

                Spacer()

                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)

                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding([.leading, .bottom, .trailing], 16)
                .padding(.top, 8)
            }
        }
        .frame(height: 150)
    }
}

// Example destination views
struct InClinicConsultationView: View {
    var body: some View {
        Text("In-Clinic Consultation")
            .navigationBarTitle("In-Clinic Consultation", displayMode: .inline)
    }
}

struct VideoConsultationView: View {
    var body: some View {
        Text("Video Consultation")
            .navigationBarTitle("Video Consultation", displayMode: .inline)
    }
}


struct ConsultationOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConsultationOptionsView(doctor: Doctor(name: "Elizabeth", reviews: 5, specialty: "eye surgeon"))
        }
    }
}
