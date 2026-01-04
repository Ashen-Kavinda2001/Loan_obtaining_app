import 'package:flutter/material.dart';

class LoanDetailsScreen extends StatefulWidget {
  const LoanDetailsScreen({super.key});

  @override
  State<LoanDetailsScreen> createState() => _LoanDetailsScreenState();
}

class _LoanDetailsScreenState extends State<LoanDetailsScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'View Detail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF3D31FF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'View detail',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),

              // Search Section
              Row(
                children: [
                  const Text('ID :', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.search, size: 35, color: Colors.black54),
                ],
              ),

              const SizedBox(height: 30),

              // Member Info
              _buildSimpleInfo('Name:', 'John Doe'),
              _buildSimpleInfo('No. :', '0712345678'),

              const SizedBox(height: 25),

              // Loan Stats
              _buildSketchStat('loan amount', '50,000'),
              _buildSketchStat('full payment\nwith int', '55,000'),
              _buildSketchStat('Full\nDuration:', '10 Weeks'),
              _buildSketchStat('Paid weeks', '3'),
              _buildSketchStat('Due amount', '38,500'),

              const SizedBox(height: 30),

              // Table
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 15,
                    headingRowColor: WidgetStateProperty.all(
                      const Color(0xFFE0E0E0),
                    ),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Week\nNo.',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'amount\nto pay',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Paid\namount',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Payment\nmethod',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Payment\nstatus',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                    rows: List.generate(
                      3,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('${index + 1}')),
                          const DataCell(Text('5,500')),
                          const DataCell(Text('5,500')),
                          const DataCell(Text('Cash')),
                          const DataCell(Text('Paid')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(value, style: const TextStyle(fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSketchStat(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              maxLines: 2,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
