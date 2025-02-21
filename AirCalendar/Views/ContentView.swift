import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date? = nil
    @State private var showingDetail = false
    
    var body: some View {
        NavigationStack {
            DayCollectionView(selectedDate: $selectedDate, showingDetail: $showingDetail)
                .ignoresSafeArea()
                .navigationDestination(isPresented: $showingDetail) {
                    if let date = selectedDate {
                        DetailCollectionView(date: date, isPresented: $showingDetail)
                    }
                }
        }
    }
}


