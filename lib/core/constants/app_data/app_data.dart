import 'package:islami_app/core/constants/app_images.dart';
import 'package:islami_app/features/hadith/data/models/hadith_model.dart';
import 'package:islami_app/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:islami_app/features/quran/data/models/sura_model.dart';

abstract final class AppData {
  static final List<OnBoardingModel> onBoardingList = const [
    OnBoardingModel(
      image: AppImages.onBoarding1,
      title: "Welcome To Islmi App",
    ),
    OnBoardingModel(
        image: AppImages.onBoarding2,
        title: "Welcome To Islami",
        subTitle: "We Are Very Excited To Have You In Our Community"),
    OnBoardingModel(
        image: AppImages.onBoarding3,
        title: "Reading the Quran",
        subTitle: "Read, and your Lord is the Most Generous"),
    OnBoardingModel(
        image: AppImages.onBoarding4,
        title: "Bearish",
        subTitle: "Praise the name of your Lord, the Most High"),
    OnBoardingModel(
        image: AppImages.onBoarding5,
        title: "Holy Quran Radio",
        subTitle:
            "You can listen to the Holy Quran Radio through the application for free and easily"),
  ];

  static final List<SuraModel> surasList = const [
    SuraModel(
        suraNumber: "1",
        suraNameEn: "Al-Fatiha",
        suraNameAr: "الفاتحه",
        versesNumber: "7"),
    SuraModel(
        suraNumber: "2",
        suraNameEn: "Al-Baqarah",
        suraNameAr: "البقرة",
        versesNumber: "286"),
    SuraModel(
        suraNumber: "3",
        suraNameEn: "Aal-E-Imran",
        suraNameAr: "آل عمران",
        versesNumber: "200"),
    SuraModel(
        suraNumber: "4",
        suraNameEn: "An-Nisa'",
        suraNameAr: "النساء",
        versesNumber: "176"),
    SuraModel(
        suraNumber: "5",
        suraNameEn: "Al-Ma'idah",
        suraNameAr: "المائدة",
        versesNumber: "120"),
    SuraModel(
        suraNumber: "6",
        suraNameEn: "Al-An'am",
        suraNameAr: "الأنعام",
        versesNumber: "165"),
    SuraModel(
        suraNumber: "7",
        suraNameEn: "Al-A'raf",
        suraNameAr: "الأعراف",
        versesNumber: "206"),
    SuraModel(
        suraNumber: "8",
        suraNameEn: "Al-Anfal",
        suraNameAr: "الأنفال",
        versesNumber: "75"),
    SuraModel(
        suraNumber: "9",
        suraNameEn: "At-Tawbah",
        suraNameAr: "التوبة",
        versesNumber: "129"),
    SuraModel(
        suraNumber: "10",
        suraNameEn: "Yunus",
        suraNameAr: "يونس",
        versesNumber: "109"),
    SuraModel(
        suraNumber: "11",
        suraNameEn: "Hud",
        suraNameAr: "هود",
        versesNumber: "123"),
    SuraModel(
        suraNumber: "12",
        suraNameEn: "Yusuf",
        suraNameAr: "يوسف",
        versesNumber: "111"),
    SuraModel(
        suraNumber: "13",
        suraNameEn: "Ar-Ra'd",
        suraNameAr: "الرعد",
        versesNumber: "43"),
    SuraModel(
        suraNumber: "14",
        suraNameEn: "Ibrahim",
        suraNameAr: "إبراهيم",
        versesNumber: "52"),
    SuraModel(
        suraNumber: "15",
        suraNameEn: "Al-Hijr",
        suraNameAr: "الحجر",
        versesNumber: "99"),
    SuraModel(
        suraNumber: "16",
        suraNameEn: "An-Nahl",
        suraNameAr: "النحل",
        versesNumber: "128"),
    SuraModel(
        suraNumber: "17",
        suraNameEn: "Al-Isra",
        suraNameAr: "الإسراء",
        versesNumber: "111"),
    SuraModel(
        suraNumber: "18",
        suraNameEn: "Al-Kahf",
        suraNameAr: "الكهف",
        versesNumber: "110"),
    SuraModel(
        suraNumber: "19",
        suraNameEn: "Maryam",
        suraNameAr: "مريم",
        versesNumber: "98"),
    SuraModel(
        suraNumber: "20",
        suraNameEn: "Ta-Ha",
        suraNameAr: "طه",
        versesNumber: "135"),
    SuraModel(
        suraNumber: "21",
        suraNameEn: "Al-Anbiya",
        suraNameAr: "الأنبياء",
        versesNumber: "112"),
    SuraModel(
        suraNumber: "22",
        suraNameEn: "Al-Hajj",
        suraNameAr: "الحج",
        versesNumber: "78"),
    SuraModel(
        suraNumber: "23",
        suraNameEn: "Al-Mu'minun",
        suraNameAr: "المؤمنون",
        versesNumber: "118"),
    SuraModel(
        suraNumber: "24",
        suraNameEn: "An-Nur",
        suraNameAr: "النّور",
        versesNumber: "64"),
    SuraModel(
        suraNumber: "25",
        suraNameEn: "Al-Furqan",
        suraNameAr: "الفرقان",
        versesNumber: "77"),
    SuraModel(
        suraNumber: "26",
        suraNameEn: "Ash-Shu'ara",
        suraNameAr: "الشعراء",
        versesNumber: "227"),
    SuraModel(
        suraNumber: "27",
        suraNameEn: "An-Naml",
        suraNameAr: "النّمل",
        versesNumber: "93"),
    SuraModel(
        suraNumber: "28",
        suraNameEn: "Al-Qasas",
        suraNameAr: "القصص",
        versesNumber: "88"),
    SuraModel(
        suraNumber: "29",
        suraNameEn: "Al-Ankabut",
        suraNameAr: "العنكبوت",
        versesNumber: "69"),
    SuraModel(
        suraNumber: "30",
        suraNameEn: "Ar-Rum",
        suraNameAr: "الرّوم",
        versesNumber: "60"),
    SuraModel(
        suraNumber: "31",
        suraNameEn: "Luqman",
        suraNameAr: "لقمان",
        versesNumber: "34"),
    SuraModel(
        suraNumber: "32",
        suraNameEn: "As-Sajda",
        suraNameAr: "السجدة",
        versesNumber: "30"),
    SuraModel(
        suraNumber: "33",
        suraNameEn: "Al-Ahzab",
        suraNameAr: "الأحزاب",
        versesNumber: "73"),
    SuraModel(
        suraNumber: "34",
        suraNameEn: "Saba",
        suraNameAr: "سبأ",
        versesNumber: "54"),
    SuraModel(
        suraNumber: "35",
        suraNameEn: "Fatir",
        suraNameAr: "فاطر",
        versesNumber: "45"),
    SuraModel(
        suraNumber: "36",
        suraNameEn: "Ya-Sin",
        suraNameAr: "يس",
        versesNumber: "83"),
    SuraModel(
        suraNumber: "37",
        suraNameEn: "As-Saffat",
        suraNameAr: "الصافات",
        versesNumber: "182"),
    SuraModel(
        suraNumber: "38",
        suraNameEn: "Sad",
        suraNameAr: "ص",
        versesNumber: "88"),
    SuraModel(
        suraNumber: "39",
        suraNameEn: "Az-Zumar",
        suraNameAr: "الزمر",
        versesNumber: "75"),
    SuraModel(
        suraNumber: "40",
        suraNameEn: "Ghafir",
        suraNameAr: "غافر",
        versesNumber: "85"),
    SuraModel(
        suraNumber: "41",
        suraNameEn: "Fussilat",
        suraNameAr: "فصّلت",
        versesNumber: "54"),
    SuraModel(
        suraNumber: "42",
        suraNameEn: "Ash-Shura",
        suraNameAr: "الشورى",
        versesNumber: "53"),
    SuraModel(
        suraNumber: "43",
        suraNameEn: "Az-Zukhruf",
        suraNameAr: "الزخرف",
        versesNumber: "89"),
    SuraModel(
        suraNumber: "44",
        suraNameEn: "Ad-Dukhan",
        suraNameAr: "الدّخان",
        versesNumber: "59"),
    SuraModel(
        suraNumber: "45",
        suraNameEn: "Al-Jathiya",
        suraNameAr: "الجاثية",
        versesNumber: "37"),
    SuraModel(
        suraNumber: "46",
        suraNameEn: "Al-Ahqaf",
        suraNameAr: "الأحقاف",
        versesNumber: "35"),
    SuraModel(
        suraNumber: "47",
        suraNameEn: "Muhammad",
        suraNameAr: "محمد",
        versesNumber: "38"),
    SuraModel(
        suraNumber: "48",
        suraNameEn: "Al-Fath",
        suraNameAr: "الفتح",
        versesNumber: "29"),
    SuraModel(
        suraNumber: "49",
        suraNameEn: "Al-Hujurat",
        suraNameAr: "الحجرات",
        versesNumber: "18"),
    SuraModel(
        suraNumber: "50",
        suraNameEn: "Qaf",
        suraNameAr: "ق",
        versesNumber: "45"),
    SuraModel(
        suraNumber: "51",
        suraNameEn: "Adh-Dhariyat",
        suraNameAr: "الذاريات",
        versesNumber: "60"),
    SuraModel(
        suraNumber: "52",
        suraNameEn: "At-Tur",
        suraNameAr: "الطور",
        versesNumber: "49"),
    SuraModel(
        suraNumber: "53",
        suraNameEn: "An-Najm",
        suraNameAr: "النجم",
        versesNumber: "62"),
    SuraModel(
        suraNumber: "54",
        suraNameEn: "Al-Qamar",
        suraNameAr: "القمر",
        versesNumber: "55"),
    SuraModel(
        suraNumber: "55",
        suraNameEn: "Ar-Rahman",
        suraNameAr: "الرحمن",
        versesNumber: "78"),
    SuraModel(
        suraNumber: "56",
        suraNameEn: "Al-Waqi'a",
        suraNameAr: "الواقعة",
        versesNumber: "96"),
    SuraModel(
        suraNumber: "57",
        suraNameEn: "Al-Hadid",
        suraNameAr: "الحديد",
        versesNumber: "29"),
    SuraModel(
        suraNumber: "58",
        suraNameEn: "Al-Mujadila",
        suraNameAr: "المجادلة",
        versesNumber: "22"),
    SuraModel(
        suraNumber: "59",
        suraNameEn: "Al-Hashr",
        suraNameAr: "الحشر",
        versesNumber: "24"),
    SuraModel(
        suraNumber: "60",
        suraNameEn: "Al-Mumtahina",
        suraNameAr: "الممتحنة",
        versesNumber: "13"),
    SuraModel(
        suraNumber: "61",
        suraNameEn: "As-Saff",
        suraNameAr: "الصف",
        versesNumber: "14"),
    SuraModel(
        suraNumber: "62",
        suraNameEn: "Al-Jumu'a",
        suraNameAr: "الجمعة",
        versesNumber: "11"),
    SuraModel(
        suraNumber: "63",
        suraNameEn: "Al-Munafiqun",
        suraNameAr: "المنافقون",
        versesNumber: "11"),
    SuraModel(
        suraNumber: "64",
        suraNameEn: "At-Taghabun",
        suraNameAr: "التغابن",
        versesNumber: "18"),
    SuraModel(
        suraNumber: "65",
        suraNameEn: "At-Talaq",
        suraNameAr: "الطلاق",
        versesNumber: "12"),
    SuraModel(
        suraNumber: "66",
        suraNameEn: "At-Tahrim",
        suraNameAr: "التحريم",
        versesNumber: "12"),
    SuraModel(
        suraNumber: "67",
        suraNameEn: "Al-Mulk",
        suraNameAr: "الملك",
        versesNumber: "30"),
    SuraModel(
        suraNumber: "68",
        suraNameEn: "Al-Qalam",
        suraNameAr: "القلم",
        versesNumber: "52"),
    SuraModel(
        suraNumber: "69",
        suraNameEn: "Al-Haqqah",
        suraNameAr: "الحاقة",
        versesNumber: "52"),
    SuraModel(
        suraNumber: "70",
        suraNameEn: "Al-Ma'arij",
        suraNameAr: "المعارج",
        versesNumber: "44"),
    SuraModel(
        suraNumber: "71",
        suraNameEn: "Nuh",
        suraNameAr: "نوح",
        versesNumber: "28"),
    SuraModel(
        suraNumber: "72",
        suraNameEn: "Al-Jinn",
        suraNameAr: "الجن",
        versesNumber: "28"),
    SuraModel(
        suraNumber: "73",
        suraNameEn: "Al-Muzzammil",
        suraNameAr: "المزّمّل",
        versesNumber: "20"),
    SuraModel(
        suraNumber: "74",
        suraNameEn: "Al-Muddathir",
        suraNameAr: "المدّثر",
        versesNumber: "56"),
    SuraModel(
        suraNumber: "75",
        suraNameEn: "Al-Qiyamah",
        suraNameAr: "القيامة",
        versesNumber: "40"),
    SuraModel(
        suraNumber: "76",
        suraNameEn: "Al-Insan",
        suraNameAr: "الإنسان",
        versesNumber: "31"),
    SuraModel(
        suraNumber: "77",
        suraNameEn: "Al-Mursalat",
        suraNameAr: "المرسلات",
        versesNumber: "50"),
    SuraModel(
        suraNumber: "78",
        suraNameEn: "An-Naba'",
        suraNameAr: "النبأ",
        versesNumber: "40"),
    SuraModel(
        suraNumber: "79",
        suraNameEn: "An-Nazi'at",
        suraNameAr: "النازعات",
        versesNumber: "46"),
    SuraModel(
        suraNumber: "80",
        suraNameEn: "Abasa",
        suraNameAr: "عبس",
        versesNumber: "42"),
    SuraModel(
        suraNumber: "81",
        suraNameEn: "At-Takwir",
        suraNameAr: "التكوير",
        versesNumber: "29"),
    SuraModel(
        suraNumber: "82",
        suraNameEn: "Al-Infitar",
        suraNameAr: "الإنفطار",
        versesNumber: "19"),
    SuraModel(
        suraNumber: "83",
        suraNameEn: "Al-Mutaffifin",
        suraNameAr: "المطفّفين",
        versesNumber: "36"),
    SuraModel(
        suraNumber: "84",
        suraNameEn: "Al-Inshiqaq",
        suraNameAr: "الإنشقاق",
        versesNumber: "25"),
    SuraModel(
        suraNumber: "85",
        suraNameEn: "Al-Buruj",
        suraNameAr: "البروج",
        versesNumber: "22"),
    SuraModel(
        suraNumber: "86",
        suraNameEn: "At-Tariq",
        suraNameAr: "الطارق",
        versesNumber: "17"),
    SuraModel(
        suraNumber: "87",
        suraNameEn: "Al-A'la",
        suraNameAr: "الأعلى",
        versesNumber: "19"),
    SuraModel(
        suraNumber: "88",
        suraNameEn: "Al-Ghashiyah",
        suraNameAr: "الغاشية",
        versesNumber: "26"),
    SuraModel(
        suraNumber: "89",
        suraNameEn: "Al-Fajr",
        suraNameAr: "الفجر",
        versesNumber: "30"),
    SuraModel(
        suraNumber: "90",
        suraNameEn: "Al-Balad",
        suraNameAr: "البلد",
        versesNumber: "20"),
    SuraModel(
        suraNumber: "91",
        suraNameEn: "Ash-Shams",
        suraNameAr: "الشمس",
        versesNumber: "15"),
    SuraModel(
        suraNumber: "92",
        suraNameEn: "Al-Lail",
        suraNameAr: "الليل",
        versesNumber: "21"),
    SuraModel(
        suraNumber: "93",
        suraNameEn: "Ad-Duha",
        suraNameAr: "الضحى",
        versesNumber: "11"),
    SuraModel(
        suraNumber: "94",
        suraNameEn: "Ash-Sharh",
        suraNameAr: "الشرح",
        versesNumber: "8"),
    SuraModel(
        suraNumber: "95",
        suraNameEn: "At-Tin",
        suraNameAr: "التين",
        versesNumber: "8"),
    SuraModel(
        suraNumber: "96",
        suraNameEn: "Al-Alaq",
        suraNameAr: "العلق",
        versesNumber: "19"),
    SuraModel(
        suraNumber: "97",
        suraNameEn: "Al-Qadr",
        suraNameAr: "القدر",
        versesNumber: "5"),
    SuraModel(
        suraNumber: "98",
        suraNameEn: "Al-Bayyina",
        suraNameAr: "البينة",
        versesNumber: "8"),
    SuraModel(
        suraNumber: "99",
        suraNameEn: "Az-Zalzalah",
        suraNameAr: "الزلزلة",
        versesNumber: "8"),
    SuraModel(
        suraNumber: "100",
        suraNameEn: "Al-Adiyat",
        suraNameAr: "العاديات",
        versesNumber: "11"),
    SuraModel(
        suraNumber: "101",
        suraNameEn: "Al-Qari'a",
        suraNameAr: "القارعة",
        versesNumber: "11"),
    SuraModel(
        suraNumber: "102",
        suraNameEn: "At-Takathur",
        suraNameAr: "التكاثر",
        versesNumber: "8"),
    SuraModel(
        suraNumber: "103",
        suraNameEn: "Al-Asr",
        suraNameAr: "العصر",
        versesNumber: "3"),
    SuraModel(
        suraNumber: "104",
        suraNameEn: "Al-Humazah",
        suraNameAr: "الهمزة",
        versesNumber: "9"),
    SuraModel(
        suraNumber: "105",
        suraNameEn: "Al-Fil",
        suraNameAr: "الفيل",
        versesNumber: "5"),
    SuraModel(
        suraNumber: "106",
        suraNameEn: "Quraysh",
        suraNameAr: "قريش",
        versesNumber: "4"),
    SuraModel(
        suraNumber: "107",
        suraNameEn: "Al-Ma'un",
        suraNameAr: "الماعون",
        versesNumber: "7"),
    SuraModel(
        suraNumber: "108",
        suraNameEn: "Al-Kawthar",
        suraNameAr: "الكوثر",
        versesNumber: "3"),
    SuraModel(
        suraNumber: "109",
        suraNameEn: "Al-Kafirun",
        suraNameAr: "الكافرون",
        versesNumber: "6"),
    SuraModel(
        suraNumber: "110",
        suraNameEn: "Al-Nasr",
        suraNameAr: "النصر",
        versesNumber: "3"),
    SuraModel(
        suraNumber: "111",
        suraNameEn: "Al-Masad",
        suraNameAr: "المسد",
        versesNumber: "5"),
    SuraModel(
        suraNumber: "112",
        suraNameEn: "Al-Ikhlas",
        suraNameAr: "الإخلاص",
        versesNumber: "4"),
    SuraModel(
        suraNumber: "113",
        suraNameEn: "Al-Falaq",
        suraNameAr: "الفلق",
        versesNumber: "5"),
    SuraModel(
        suraNumber: "114",
        suraNameEn: "Al-Nas",
        suraNameAr: "الناس",
        versesNumber: "6"),
  ];

  static List<HadithModel> hadithList = [
    HadithModel(hadithNameAr: "الحديث الأول", hadithNameEn: "Hadith 1"),
    HadithModel(hadithNameAr: "الحديث الثاني", hadithNameEn: "Hadith 2"),
    HadithModel(hadithNameAr: "الحديث الثالث", hadithNameEn: "Hadith 3"),
    HadithModel(hadithNameAr: "الحديث الرابع", hadithNameEn: "Hadith 4"),
    HadithModel(hadithNameAr: "الحديث الخامس", hadithNameEn: "Hadith 5"),
    HadithModel(hadithNameAr: "الحديث السادس", hadithNameEn: "Hadith 6"),
    HadithModel(hadithNameAr: "الحديث السابع", hadithNameEn: "Hadith 7"),
    HadithModel(hadithNameAr: "الحديث الثامن", hadithNameEn: "Hadith 8"),
    HadithModel(hadithNameAr: "الحديث التاسع", hadithNameEn: "Hadith 9"),
    HadithModel(hadithNameAr: "الحديث العاشر", hadithNameEn: "Hadith 10"),
    HadithModel(hadithNameAr: "الحديث الحادي عشر", hadithNameEn: "Hadith 11"),
    HadithModel(hadithNameAr: "الحديث الثاني عشر", hadithNameEn: "Hadith 12"),
    HadithModel(hadithNameAr: "الحديث الثالث عشر", hadithNameEn: "Hadith 13"),
    HadithModel(hadithNameAr: "الحديث الرابع عشر", hadithNameEn: "Hadith 14"),
    HadithModel(hadithNameAr: "الحديث الخامس عشر", hadithNameEn: "Hadith 15"),
    HadithModel(hadithNameAr: "الحديث السادس عشر", hadithNameEn: "Hadith 16"),
    HadithModel(hadithNameAr: "الحديث السابع عشر", hadithNameEn: "Hadith 17"),
    HadithModel(hadithNameAr: "الحديث الثامن عشر", hadithNameEn: "Hadith 18"),
    HadithModel(hadithNameAr: "الحديث التاسع عشر", hadithNameEn: "Hadith 19"),
    HadithModel(hadithNameAr: "الحديث العشرون", hadithNameEn: "Hadith 20"),
    HadithModel(
        hadithNameAr: "الحديث الحادي والعشرون", hadithNameEn: "Hadith 21"),
    HadithModel(
        hadithNameAr: "الحديث الثاني والعشرون", hadithNameEn: "Hadith 22"),
    HadithModel(
        hadithNameAr: "الحديث الثالث والعشرون", hadithNameEn: "Hadith 23"),
    HadithModel(
        hadithNameAr: "الحديث الرابع والعشرون", hadithNameEn: "Hadith 24"),
    HadithModel(
        hadithNameAr: "الحديث الخامس والعشرون", hadithNameEn: "Hadith 25"),
    HadithModel(
        hadithNameAr: "الحديث السادس والعشرون", hadithNameEn: "Hadith 26"),
    HadithModel(
        hadithNameAr: "الحديث السابع والعشرون", hadithNameEn: "Hadith 27"),
    HadithModel(
        hadithNameAr: "الحديث الثامن والعشرون", hadithNameEn: "Hadith 28"),
    HadithModel(
        hadithNameAr: "الحديث التاسع والعشرون", hadithNameEn: "Hadith 29"),
    HadithModel(hadithNameAr: "الحديث الثلاثون", hadithNameEn: "Hadith 30"),
    HadithModel(
        hadithNameAr: "الحديث الحادي والثلاثون", hadithNameEn: "Hadith 31"),
    HadithModel(
        hadithNameAr: "الحديث الثاني والثلاثون", hadithNameEn: "Hadith 32"),
    HadithModel(
        hadithNameAr: "الحديث الثالث والثلاثون", hadithNameEn: "Hadith 33"),
    HadithModel(
        hadithNameAr: "الحديث الرابع والثلاثون", hadithNameEn: "Hadith 34"),
    HadithModel(
        hadithNameAr: "الحديث الخامس والثلاثون", hadithNameEn: "Hadith 35"),
    HadithModel(
        hadithNameAr: "الحديث السادس والثلاثون", hadithNameEn: "Hadith 36"),
    HadithModel(
        hadithNameAr: "الحديث السابع والثلاثون", hadithNameEn: "Hadith 37"),
    HadithModel(
        hadithNameAr: "الحديث الثامن والثلاثون", hadithNameEn: "Hadith 38"),
    HadithModel(
        hadithNameAr: "الحديث التاسع والثلاثون", hadithNameEn: "Hadith 39"),
    HadithModel(hadithNameAr: "الحديث الأربعون", hadithNameEn: "Hadith 40"),
    HadithModel(
        hadithNameAr: "الحديث الحادي والأربعون", hadithNameEn: "Hadith 41"),
    HadithModel(
        hadithNameAr: "الحديث الثاني والأربعون", hadithNameEn: "Hadith 42"),
    HadithModel(
        hadithNameAr: "الحديث الثالث والأربعون", hadithNameEn: "Hadith 43"),
    HadithModel(
        hadithNameAr: "الحديث الرابع والأربعون", hadithNameEn: "Hadith 44"),
    HadithModel(
        hadithNameAr: "الحديث الخامس والأربعون", hadithNameEn: "Hadith 45"),
    HadithModel(
        hadithNameAr: "الحديث السادس والأربعون", hadithNameEn: "Hadith 46"),
    HadithModel(
        hadithNameAr: "الحديث السابع والأربعون", hadithNameEn: "Hadith 47"),
    HadithModel(
        hadithNameAr: "الحديث الثامن والأربعون", hadithNameEn: "Hadith 48"),
    HadithModel(
        hadithNameAr: "الحديث التاسع والأربعون", hadithNameEn: "Hadith 49"),
    HadithModel(hadithNameAr: "الحديث الخمسون", hadithNameEn: "Hadith 50"),
  ];
}
