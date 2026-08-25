import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Keuangan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const KeuanganApp(),
    );
  }
}

class KeuanganApp extends StatefulWidget {
  const KeuanganApp({Key? key}) : super(key: key);

  @override
  State<KeuanganApp> createState() => _KeuanganAppState();
}

class Transaksi {
  final String id;
  final String judul;
  final double jumlah;
  final String tipe; // 'masuk' atau 'keluar'
  final String kategori;
  final DateTime tanggal;

  Transaksi({
    required this.id,
    required this.judul,
    required this.jumlah,
    required this.tipe,
    required this.kategori,
    required this.tanggal,
  });
}

class _KeuanganAppState extends State<KeuanganApp> {
  final List<Transaksi> daftarTransaksi = [];
  final TextEditingController judulController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  
  String tipeSelected = 'masuk';
  String kategoriSelected = 'Lainnya';
  DateTime tanggalSelected = DateTime.now();

  final List<String> kategoriMasuk = [
    'Gaji',
    'Bisnis',
    'Investasi',
    'Bonus',
    'Lainnya'
  ];

  final List<String> kategoriKeluar = [
    'Makanan',
    'Transport',
    'Hiburan',
    'Belanja',
    'Tagihan',
    'Kesehatan',
    'Lainnya'
  ];

  double getTotalSaldo() {
    double saldo = 0;
    for (var transaksi in daftarTransaksi) {
      if (transaksi.tipe == 'masuk') {
        saldo += transaksi.jumlah;
      } else {
        saldo -= transaksi.jumlah;
      }
    }
    return saldo;
  }

  void tambahTransaksi() {
    if (judulController.text.isEmpty || jumlahController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field harus diisi!')),
      );
      return;
    }

    final newTransaksi = Transaksi(
      id: DateTime.now().toString(),
      judul: judulController.text,
      jumlah: double.parse(jumlahController.text),
      tipe: tipeSelected,
      kategori: kategoriSelected,
      tanggal: tanggalSelected,
    );

    setState(() {
      daftarTransaksi.add(newTransaksi);
      judulController.clear();
      jumlahController.clear();
      tipeSelected = 'masuk';
      kategoriSelected = 'Lainnya';
      tanggalSelected = DateTime.now();
    });

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaksi berhasil ditambahkan!')),
    );
  }

  void hapusTransaksi(String id) {
    setState(() {
      daftarTransaksi.removeWhere((transaksi) => transaksi.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Transaksi dihapus!')),
    );
  }

  void tampilDialogTambah() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setStateDialog) => AlertDialog(
          title: const Text('Tambah Transaksi'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Input Judul
                TextField(
                  controller: judulController,
                  decoration: InputDecoration(
                    labelText: 'Judul Transaksi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Input Jumlah
                TextField(
                  controller: jumlahController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Jumlah (Rp)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Pilih Tipe
                DropdownButtonFormField<String>(
                  value: tipeSelected,
                  items: const [
                    DropdownMenuItem(value: 'masuk', child: Text('💰 Pemasukan')),
                    DropdownMenuItem(value: 'keluar', child: Text('💸 Pengeluaran')),
                  ],
                  onChanged: (value) {
                    setStateDialog(() {
                      tipeSelected = value ?? 'masuk';
                      kategoriSelected = 'Lainnya';
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Pilih Kategori
                DropdownButtonFormField<String>(
                  value: kategoriSelected,
                  items: (tipeSelected == 'masuk' ? kategoriMasuk : kategoriKeluar)
                      .map((kategori) => DropdownMenuItem(
                            value: kategori,
                            child: Text(kategori),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setStateDialog(() {
                      kategoriSelected = value ?? 'Lainnya';
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Pilih Tanggal
                GestureDetector(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: tanggalSelected,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      setStateDialog(() {
                        tanggalSelected = picked;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd/MM/yyyy').format(tanggalSelected),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(Icons.calendar_today),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: tambahTransaksi,
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double saldo = getTotalSaldo();
    double totalMasuk = daftarTransaksi
        .where((t) => t.tipe == 'masuk')
        .fold(0, (sum, t) => sum + t.jumlah);
    double totalKeluar = daftarTransaksi
        .where((t) => t.tipe == 'keluar')
        .fold(0, (sum, t) => sum + t.jumlah);

    return Scaffold(
      appBar: AppBar(
        title: const Text('💰 Aplikasi Keuangan'),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Card Saldo
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue.shade700,
            child: Column(
              children: [
                const Text(
                  'Saldo Total',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Rp ${saldo.toStringAsFixed(0).replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Pemasukan
                    Column(
                      children: [
                        const Text(
                          'Pemasukan',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${totalMasuk.toStringAsFixed(0).replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}',
                          style: const TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    // Pengeluaran
                    Column(
                      children: [
                        const Text(
                          'Pengeluaran',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rp ${totalKeluar.toStringAsFixed(0).replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}',
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Daftar Transaksi
          Expanded(
            child: daftarTransaksi.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long,
                          size: 64,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Belum ada transaksi',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: daftarTransaksi.length,
                    itemBuilder: (context, index) {
                      final transaksi = daftarTransaksi[index];
                      final isKeluaran = transaksi.tipe == 'keluar';

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: isKeluaran
                                  ? Colors.red.shade100
                                  : Colors.green.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              isKeluaran
                                  ? Icons.arrow_downward
                                  : Icons.arrow_upward,
                              color: isKeluaran
                                  ? Colors.red.shade700
                                  : Colors.green.shade700,
                            ),
                          ),
                          title: Text(
                            transaksi.judul,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(transaksi.kategori),
                              Text(
                                DateFormat('dd/MM/yyyy').format(transaksi.tanggal),
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${isKeluaran ? '-' : '+'} Rp ${transaksi.jumlah.toStringAsFixed(0).replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.')}',
                                style: TextStyle(
                                  color: isKeluaran
                                      ? Colors.red.shade700
                                      : Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => hapusTransaksi(transaksi.id),
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade700,
        onPressed: tampilDialogTambah,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  @override
  void dispose() {
    judulController.dispose();
    jumlahController.dispose();
    super.dispose();
  }
}
