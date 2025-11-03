import '../models/question_model.dart';

final Map<String, List<Question>> quizData = {
  'Pengetahuan': [
    Question(text: "Ibukota dari Australia adalah…",
        options: ["A. Sydney", "B. Canberra", "C. Melbourne", "D. Perth"],
        correctAnswerIndex: 1),
    Question(text: "Planet terbesar di tata surya adalah…",
        options: ["A. Bumi", "B. Jupiter", "C. Mars", "D. Saturnus"],
        correctAnswerIndex: 1),
    Question(text: "Siapa penemu bola lampu pijar?",
        options: [
          "A. Nikola Tesla",
          "B. Thomas Alva Edison",
          "C. Alexander Graham Bell",
          "D. Isaac Newton"
        ],
        correctAnswerIndex: 1),
    Question(text: "Hewan tercepat di darat adalah…",
        options: ["A. Kuda", "B. Harimau", "C. Cheetah", "D. Singa"],
        correctAnswerIndex: 2),
    Question(text: "Gunung tertinggi di dunia adalah…",
        options: ["A. Kilimanjaro", "B. Elbrus", "C. Everest", "D. Aconcagua"],
        correctAnswerIndex: 2),
    Question(text: "Negara dengan jumlah penduduk terbanyak adalah…",
        options: [
          "A. India",
          "B. Amerika Serikat",
          "C. Tiongkok",
          "D. Indonesia"
        ],
        correctAnswerIndex: 0),
    Question(text: "Benua yang paling luas di dunia adalah…",
        options: ["A. Afrika", "B. Asia", "C. Eropa", "D. Amerika"],
        correctAnswerIndex: 1),
    Question(text: "Hasil utama dari fotosintesis adalah…",
        options: ["A. Oksigen", "B. Karbon dioksida", "C. Nitrogen", "D. Air"],
        correctAnswerIndex: 0),
    Question(text: "Warna primer terdiri dari…",
        options: [
          "A. Merah, kuning, biru",
          "B. Hijau, ungu, merah",
          "C. Kuning, hijau, oranye",
          "D. Biru, ungu, hitam"
        ],
        correctAnswerIndex: 0),
    Question(text: "Siapakah presiden pertama Indonesia?",
        options: [
          "A. Soeharto",
          "B. Megawati",
          "C. B.J. Habibie",
          "D. Soekarno"
        ],
        correctAnswerIndex: 3),
  ],
  'Olahraga': [
    Question(text: "Jumlah pemain dalam satu tim sepak bola adalah…",
        options: ["A. 10", "B. 11", "C. 12", "D. 9"],
        correctAnswerIndex: 1),
    Question(text: "Dalam bola basket, poin dari luar garis 3 poin bernilai…",
        options: ["A. 2", "B. 3", "C. 1", "D. 4"],
        correctAnswerIndex: 1),
    Question(text: "Olahraga renang menggunakan gaya bebas disebut…",
        options: [
          "A. Butterfly",
          "B. Freestyle",
          "C. Breaststroke",
          "D. Backstroke"
        ],
        correctAnswerIndex: 1),
    Question(text: "Negara asal olahraga Sumo adalah…",
        options: [
          "A. Korea Selatan",
          "B. Jepang",
          "C. Tiongkok",
          "D. Thailand"
        ],
        correctAnswerIndex: 1),
    Question(
        text: "Siapa atlet bulu tangkis Indonesia yang dijuluki “The Minions”?",
        options: [
          "A. Hendra & Ahsan",
          "B. Kevin & Marcus",
          "C. Taufik & Sony",
          "D. Greysia & Apriyani"
        ],
        correctAnswerIndex: 1),
    Question(text: "Olahraga tenis meja disebut juga…",
        options: ["A. Badminton", "B. Pingpong", "C. Squash", "D. Paddle"],
        correctAnswerIndex: 1),
    Question(text: "Negara yang memenangkan Piala Dunia FIFA 2018 adalah…",
        options: ["A. Brasil", "B. Jerman", "C. Prancis", "D. Argentina"],
        correctAnswerIndex: 2),
    Question(
        text: "Dalam voli, berapa poin yang dibutuhkan untuk memenangkan satu set?",
        options: ["A. 21", "B. 25", "C. 30", "D. 15"],
        correctAnswerIndex: 1),
    Question(text: "Alat yang digunakan dalam golf disebut…",
        options: ["A. Stick", "B. Raket", "C. Bat", "D. Club"],
        correctAnswerIndex: 3), // Club adalah istilah yang lebih tepat
    Question(
        text: "Siapa pembalap Formula 1 asal Inggris yang terkenal dengan tim Mercedes?",
        options: [
          "A. Max Verstappen",
          "B. Charles Leclerc",
          "C. Lewis Hamilton",
          "D. Fernando Alonso"
        ],
        correctAnswerIndex: 2),
  ],
  'Budaya & Sejarah': [
    Question(text: "Candi Borobudur terletak di…",
        options: [
          "A. Jawa Barat",
          "B. Jawa Tengah",
          "C. Jawa Timur",
          "D. D.I. Yogyakarta"
        ],
        correctAnswerIndex: 1),
    Question(text: "Kerajaan Hindu tertua di Indonesia adalah…",
        options: [
          "A. Kutai",
          "B. Majapahit",
          "C. Sriwijaya",
          "D. Tarumanegara"
        ],
        correctAnswerIndex: 0),
    Question(text: "Tari Saman berasal dari…",
        options: [
          "A. Aceh",
          "B. Sumatera Barat",
          "C. Kalimantan",
          "D. Sulawesi"
        ],
        correctAnswerIndex: 0),
    Question(text: "Proklamasi Kemerdekaan Indonesia dibacakan pada tahun…",
        options: ["A. 1944", "B. 1945", "C. 1946", "D. 1947"],
        correctAnswerIndex: 1),
    Question(text: "Lagu kebangsaan Indonesia adalah…",
        options: [
          "A. Indonesia Tanah Airku",
          "B. Indonesia Raya",
          "C. Bagimu Negeri",
          "D. Garuda Pancasila"
        ],
        correctAnswerIndex: 1),
    Question(text: "Pahlawan nasional dari Maluku adalah…",
        options: [
          "A. Pattimura",
          "B. Cut Nyak Dien",
          "C. Diponegoro",
          "D. Sultan Hasanuddin"
        ],
        correctAnswerIndex: 0),
    Question(text: "Rumah adat Tongkonan berasal dari…",
        options: ["A. Toraja", "B. Bali", "C. Papua", "D. Kalimantan"],
        correctAnswerIndex: 0),
    Question(text: "Kitab Sutasoma ditulis oleh…",
        options: [
          "A. Mpu Tantular",
          "B. Mpu Prapanca",
          "C. Mpu Kanwa",
          "D. Mpu Sedah"
        ],
        correctAnswerIndex: 0),
    Question(text: "Kerajaan Islam pertama di Indonesia adalah…",
        options: ["A. Demak", "B. Samudra Pasai", "C. Banten", "D. Mataram"],
        correctAnswerIndex: 1),
    Question(text: "Upacara Ngaben berasal dari daerah…",
        options: ["A. Jawa", "B. Bali", "C. Sumatera", "D. Kalimantan"],
        correctAnswerIndex: 1),
  ],
  'Logika & Teka-Teki': [
    Question(
        text: "Jika 5 mesin membutuhkan 5 menit untuk membuat 5 barang, berapa menit dibutuhkan 100 mesin untuk membuat 100 barang?",
        options: ["A. 5", "B. 10", "C. 20", "D. 100"],
        correctAnswerIndex: 0),
    Question(
        text: "Jika kamu punya 3 apel dan mengambil 2, berapa apel yang kamu punya?",
        options: ["A. 1", "B. 2", "C. 3", "D. 5"],
        correctAnswerIndex: 1),
    Question(
        text: "Dalam sebuah perlombaan, kamu menyalip orang di posisi kedua. Kamu sekarang di posisi…",
        options: ["A. Pertama", "B. Kedua", "C. Ketiga", "D. Keempat"],
        correctAnswerIndex: 1),
    Question(text: "Sebelum gunung ditemukan, di mana dia berada?",
        options: [
          "A. Di bawah tanah",
          "B. Di peta",
          "C. Di langit",
          "D. Tidak ada"
        ],
        correctAnswerIndex: 0),
    // Jawaban bisa bervariasi, ini salah satu logika
    Question(
        text: "Ada 6 telur, kamu memecahkan 2, memasak 2, dan memakan 2. Berapa telur yang tersisa?",
        options: ["A. 0", "B. 2", "C. 4", "D. 6"],
        correctAnswerIndex: 2),
    // Sisa 4 telur (yang pecah/masak tetap telur)
    Question(
        text: "Jika semua kucing adalah hewan, dan beberapa hewan adalah anjing, maka…",
        options: [
          "A. Semua kucing adalah anjing",
          "B. Beberapa hewan bukan kucing",
          "C. Semua hewan adalah kucing",
          "D. Tidak ada hewan"
        ],
        correctAnswerIndex: 1),
    Question(text: "Apa yang semakin banyak diambil semakin besar?",
        options: ["A. Lubang", "B. Batu", "C. Bayangan", "D. Cahaya"],
        correctAnswerIndex: 0),
    Question(
        text: "Aku punya kota tanpa rumah, gunung tanpa tanah, dan sungai tanpa air. Siapakah aku?",
        options: ["A. Peta", "B. Dunia", "C. Mimpi", "D. Lukisan"],
        correctAnswerIndex: 0),
    Question(
        text: "Jika 2 ayam bisa bertelur 2 butir dalam 2 hari, berapa butir telur dihasilkan oleh 6 ayam dalam 6 hari?",
        options: ["A. 9", "B. 18", "C. 12", "D. 6"],
        correctAnswerIndex: 1),
    Question(
        text: "Jika satu jam menunjukkan pukul 3, maka berapa derajat sudut antara jarum jam dan menit?",
        options: ["A. 45°", "B. 60°", "C. 90°", "D. 120°"],
        correctAnswerIndex: 2),
  ],
};