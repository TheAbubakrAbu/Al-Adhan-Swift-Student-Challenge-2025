import SwiftUI

struct AdhkarView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("REMEMBRANCES OF ALLAH")) {
                    AdhkarRow(arabicText: "سبحان الله", transliteration: "SubhanAllah", translation: "Glory be to Allah")
                    AdhkarRow(arabicText: "الحمد لله", transliteration: "Alhamdulillah", translation: "Praise be to Allah")
                    AdhkarRow(arabicText: "الله أكبر", transliteration: "Allahu Akbar", translation: "Allah is the Greatest")
                    AdhkarRow(arabicText: "لا إله إلا الله", transliteration: "La ilaha illallah", translation: "There is no deity worthy of worship except Allah")
                    AdhkarRow(arabicText: "أستغفر الله", transliteration: "Astaghfirullah", translation: "I seek forgiveness from Allah")
                    AdhkarRow(arabicText: "لا حول ولا قوة إلا بالله", transliteration: "La hawla wala quwwata illa billah", translation: "There is no power or might except with Allah")
                    AdhkarRow(arabicText: "الحمد لله رب العالمين", transliteration: "Alhamdulillahi rabbil 'alamin", translation: "Praise be to Allah, the Lord of all the worlds")
                    AdhkarRow(arabicText: "سبحان الله وبحمده", transliteration: "SubhanAllahi wa bihamdihi", translation: "Glory be to Allah and praise be to Him")
                    AdhkarRow(arabicText: "اللهم صل على محمد وعلى آل محمد", transliteration: "Allahumma salli 'ala Muhammad wa 'ala ali Muhammad", translation: "O Allah, send blessings upon Muhammad and his family")
                    AdhkarRow(arabicText: "لا إله إلا الله وحده لا شريك له، له الملك وله الحمد، وهو على كل شيء قدير", transliteration: "La ilaha illallah wahdahu la sharika lah, lahul-mulk wa lahul-hamd, wa huwa 'ala kulli shayin qadir", translation: "There is no deity worthy of worship except Allah, alone, without any partner. His is the sovereignty and His is the praise, and He is capable of all things")
                }
            }
            .navigationTitle("Common Adhkar")
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(settings.accentColor.color)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
        }
    }
}

struct DuaView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("SUPPLICATIONS TO ALLAH")) {
                    AdhkarRow(arabicText: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ زَوَالِ نِعْمَتِكَ وَتَحَوُّلِ عَافِيَتِكَ وَفُجَاءَةِ نِقْمَتِكَ وَجَمِيعِ سَخَطِكَ", transliteration: "Allahumma inni a'udhu bika min zawali ni'matika wa tahawwuli 'afiyatika wa fuja'ati niqmatika wa jamee' sakhatika", translation: "O Allah, I seek refuge in You from the removal of Your blessings, changing of Your protection, sudden wrath, and all of Your displeasure")
                    
                    AdhkarRow(arabicText: "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ", transliteration: "Allahumma inni as'aluka al-'afwa wal-'afiyah fi ad-dunya wal-akhirah", translation: "O Allah, I ask You for forgiveness and well-being in this life and the hereafter")
                    
                    AdhkarRow(arabicText: "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى وَالتُّقَى وَالْعَفَافَ وَالْغِنَى", transliteration: "Allahumma inni as'aluka al-huda wa at-tuqaa wal-'afaafa wal-ghina", translation: "O Allah, I ask You for guidance, righteousness, chastity, and sufficiency")
                    
                    AdhkarRow(arabicText: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْكُفْرِ وَالْفَقْرِ وَأَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ", transliteration: "Allahumma inni a'udhu bika min al-kufr wal-faqr wa a'udhu bika min 'adhab al-qabr", translation: "O Allah, I seek refuge in You from disbelief, poverty, and the punishment of the grave")
                    
                    AdhkarRow(arabicText: "اللَّهُمَّ مَا أَصْبَحَ بِي مِنْ نِعْمَةٍ أَوْ بِأَحَدٍ مِنْ خَلْقِكَ فَمِنْكَ وَحْدَكَ لَا شَرِيكَ لَكَ فَلَكَ الْحَمْدُ وَلَكَ الشُّكْرُ", transliteration: "Allahumma ma asbaha bi min ni'matin, aw bi ahadin min khalqika, faminka wahdaka la sharika laka, falaka alhamdu wa laka ash-shukr", translation: "O Allah, whatever blessings I or any of Your creatures rose up with, is from You alone, without partner, so for You is all praise and unto You all thanks.")
                    
                    AdhkarRow(arabicText: "رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي", transliteration: "Rabbi ishrah li sadri wa yassir li amri", translation: "O my Lord, expand for me my chest, and ease for me my task.")
                    
                    AdhkarRow(arabicText: "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ", transliteration: "Allahumma a'innee ala dhikrika wa shukrika wa husni ibadatika", translation: "O Allah, assist me in remembering You, in thanking You, and in worshipping You in the best manner.")
                    
                    AdhkarRow(arabicText: "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ", transliteration: "Rabbanaa atinaa fid-dunya hasanatan wa fil aakhirati hasanatan wa qinaa 'adhaaban-naar", translation: "Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good and protect us from the punishment of the Fire.")
                    
                    AdhkarRow(arabicText: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ عَجْزِ وَالْكَسَلِ وَالْجُبْنِ وَالْهَرَمِ وَالْبُخْلِ وَأَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ وَمِنْ فِتْنَةِ الْمَحْيَا وَالْمَمَاتِ", transliteration: "Allahumma inni a'udhu bika min al-'ajzi wal-kasali wal-jubni wal-harami wal-bukhli, wa a'udhu bika min 'adhab al-qabr, wa min fitnat al-mahya wal-mamat", translation: "O Allah, I seek refuge in You from weakness and laziness, miserliness and cowardice, the burden of debts and from being overpowered by men. I seek refuge in You from the punishment of the grave and from the trials and tribulations of life and death.")
                    
                    AdhkarRow(arabicText: "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا", transliteration: "Allahumma inni as'aluka 'ilman nafi'an, wa rizqan tayyiban, wa 'amalan mutaqabbalan", translation: "O Allah, I ask You for knowledge that is of benefit, a good provision, and deeds that will be accepted.")
                }
            }
            .navigationTitle("Common Duas")
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(settings.accentColor.color)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
        }
    }
}

struct AdhkarRow: View {
    @EnvironmentObject var settings: Settings
    
    let arabicText: String
    let transliteration: String
    let translation: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(arabicText)
                .font(.headline)
                .foregroundColor(settings.accentColor.color)
            Text(transliteration)
                .font(.subheadline)
            Text(translation)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct TasbihView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var counters: [Int: Int] = [:]
    @State private var selectedDhikrIndex: Int = 0
    
    let tasbihData: [(arabic: String, english: String, translation: String)] = [
        (arabic: "سُبْحَانَ اللّٰه", english: "Subhanallah", translation: "Glory be to Allah"),
        (arabic: "الْحَمْدُ لِلّٰه", english: "Alhamdullilah", translation: "Praise be to Allah"),
        (arabic: "اللّٰهُ أَكْبَر", english: "Allahu Akbar", translation: "Allah is the Greatest"),
        (arabic: "أَسْتَغْفِرُ اللّٰه", english: "Astaghfirullah", translation: "I seek Allah's forgiveness"),
    ]
    
    private func binding(for index: Int) -> Binding<Int> {
        Binding<Int>(
            get: { self.counters[index, default: 0] },
            set: { self.counters[index] = $0 }
        )
    }
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("GLORIFICATIONS OF ALLAH")) {
                    ForEach(tasbihData.indices, id: \.self) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(selectedDhikrIndex == index ? settings.accentColor.color.opacity(0.25) : settings.accentColor.color.opacity(0.0001))
                                .padding(.horizontal, -12)
                            
                            TasbihRow(tasbih: tasbihData[index], counter: binding(for: index))
                                .environmentObject(settings)
                        }
                        .onTapGesture {
                            withAnimation {
                                self.selectedDhikrIndex = index
                            }
                        }
                    }
                    
                    let selectedDhikr = tasbihData[selectedDhikrIndex]
                    let counterBinding = binding(for: selectedDhikrIndex)
                    
                    HStack {
                        Spacer()
                        
                        ZStack {
                            ProgressCircleView(progress: counterBinding.wrappedValue)
                                .scaledToFit()
                                .frame(maxWidth: 175, maxHeight: 175)
                            
                            VStack(alignment: .center, spacing: 5) {
                                Text(selectedDhikr.arabic)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(settings.accentColor.color)
                                Text(selectedDhikr.english)
                                    .font(.subheadline)
                                
                                CounterView(counter: counterBinding)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .cornerRadius(15)
                }
            }
            .onAppear {
                for index in tasbihData.indices {
                    counters[index] = counters[index] ?? 0
                }
            }
            .navigationTitle("Tasbih Counter")
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(settings.accentColor.color)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
        }
    }
}

struct ProgressCircleView: View {
    var progress: Int
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        let progressFraction = CGFloat(progress % 33) / 33
        return ZStack {
            Circle()
                .stroke(lineWidth: 15)
                .opacity(0.3)
                .foregroundColor(settings.accentColor.color)

            Circle()
                .trim(from: 0.0, to: progressFraction)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .foregroundColor(settings.accentColor.color)
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear, value: progressFraction)
        }
    }
}

struct CounterView: View {
    @EnvironmentObject var settings: Settings
    
    @Binding var counter: Int

    var body: some View {
        HStack {
            Image(systemName: "minus.circle")
                .font(.title2)
                .foregroundColor(counter == 0 ? .secondary : settings.accentColor.color)
                .onTapGesture {
                    if counter > 0 {
                        counter -= 1
                    }
                }

            Text("\(counter)")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal, 2)

            Image(systemName: "plus.circle")
                .font(.title2)
                .foregroundColor(settings.accentColor.color)
                .onTapGesture {
                    counter += 1
                }
        }
    }
}

struct TasbihRow: View {
    @EnvironmentObject var settings: Settings
    
    let tasbih: (arabic: String, english: String, translation: String)
    
    @Binding var counter: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(tasbih.arabic)
                    .font(.headline)
                    .foregroundColor(settings.accentColor.color)
                Text(tasbih.english)
                    .font(.subheadline)
                Text(tasbih.translation)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack {
                HStack {
                    Image(systemName: "minus.circle")
                        .foregroundColor(counter == 0 ? .secondary : settings.accentColor.color)
                        .onTapGesture {                            
                            if counter > 0 {
                                counter -= 1
                            }
                        }
                    
                    Text("\(counter)")
                    
                    Image(systemName: "plus.circle")
                        .foregroundColor(settings.accentColor.color)
                        .onTapGesture {                            
                            counter += 1
                        }
                }
                
                Text("Reset")
                    .font(.subheadline)
                    .onTapGesture {
                        counter = 0
                    }
            }
        }
    }
}

struct DateView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var hijriDate = Date()
    @State private var gregorianDate = Date()
    @State private var selectedTab: ConversionTab = .hijriToGregorian
    
    enum ConversionTab {
        case hijriToGregorian, gregorianToHijri
    }
    
    let hijriCalendar: Calendar = {
        var calendar = Calendar(identifier: .islamicUmmAlQura)
        calendar.locale = Locale(identifier: "ar")
        return calendar
    }()
    
    let gregorianCalendar = Calendar(identifier: .gregorian)
    
    private let hijriDateFormatterEnglish: DateFormatter = {
        let formatter = DateFormatter()
        var hijriCalendar = Calendar(identifier: .islamicUmmAlQura)
        hijriCalendar.locale = Locale(identifier: "ar")
        formatter.calendar = hijriCalendar
        formatter.dateFormat = "EEEE, d MMMM yyyy"
        formatter.locale = Locale(identifier: "en")
        return formatter
    }()
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("SELECT DATE")) {
                    if selectedTab == .hijriToGregorian {
                        datePickerSection(title: "Select Hijri Date", date: $hijriDate.animation(.easeInOut), calendar: hijriCalendar)
                            .onChange(of: hijriDate) {
                                convertToGregorian()
                            }
                    } else {
                        datePickerSection(title: "Select Gregorian Date", date: $gregorianDate.animation(.easeInOut), calendar: gregorianCalendar)
                            .onChange(of: gregorianDate) {
                                convertToHijri()
                            }
                    }
                    
                    Picker("Conversion Type", selection: $selectedTab.animation(.easeInOut)) {
                        Text("Hijri to Gregorian").tag(ConversionTab.hijriToGregorian)
                        Text("Gregorian to Hijri").tag(ConversionTab.gregorianToHijri)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .padding(.horizontal, 4)
                }
                
                Section(header: Text("CONVERTED DATE")) {
                    Text(selectedTab == .hijriToGregorian ? formattedDate(date: gregorianDate, using: gregorianCalendar) : formattedDate(date: hijriDate, using: hijriCalendar))
                        .bold()
                        .foregroundColor(settings.accentColor.color)
                }
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(settings.accentColor.color)
                    .foregroundColor(.primary)
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
            }
        }
        .navigationTitle("Hijri Converter")
    }
    
    private func datePickerSection(title: String, date: Binding<Date>, calendar: Calendar) -> some View {
        VStack(alignment: .leading) {
            DatePicker(title, selection: date.animation(.easeInOut), displayedComponents: .date)
                .environment(\.calendar, calendar)
                .datePickerStyle(.graphical)
                .frame(maxHeight: 400)
        }
    }

    private func convertToGregorian() {
        withAnimation {
            gregorianDate = hijriCalendar.date(from: hijriCalendar.dateComponents([.year, .month, .day], from: hijriDate)) ?? Date()
        }
    }
    
    private func convertToHijri() {
        withAnimation {
            hijriDate = gregorianCalendar.date(from: gregorianCalendar.dateComponents([.year, .month, .day], from: gregorianDate)) ?? Date()
        }
    }
    
    private func formattedDate(date: Date, using calendar: Calendar) -> String {
        let dateFormatter = calendar.identifier == Calendar.Identifier.islamicUmmAlQura ? hijriDateFormatterEnglish : DateFormatter()
        if calendar.identifier != Calendar.Identifier.islamicUmmAlQura {
            dateFormatter.calendar = calendar
            dateFormatter.dateFormat = "EEEE, d MMMM yyyy"
        }
        return dateFormatter.string(from: date)
    }
}
