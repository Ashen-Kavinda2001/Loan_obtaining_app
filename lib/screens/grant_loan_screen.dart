import 'package:flutter/material.dart';

class GrantLoanScreen extends StatefulWidget {
  const GrantLoanScreen({super.key});

  @override
  State<GrantLoanScreen> createState() => _GrantLoanScreenState();
}

class _GrantLoanScreenState extends State<GrantLoanScreen> {
  final _searchController = TextEditingController();
  final _amountController = TextEditingController();
  final _fullPayWithIntController = TextEditingController();
  final _weeklyAmountController = TextEditingController();

  String? _selectedInterest;
  String? _selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Grant Loan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF3D31FF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            const Text(
              'Grant Loan',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 25),

            // Search field
            Row(
              children: [
                const Text('ID :', style: TextStyle(fontSize: 24)),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.search, size: 35),
              ],
            ),

            const SizedBox(height: 30),

            // Member Details Section
            _buildSketchField('Name:', 'John Doe'),
            _buildSketchField('No. :', '0771234567'),
            _buildSketchField('Vill :', 'Colombo'),
            _buildSketchField('Age:', '28'),
            _buildSketchField('Name:', 'Emily (Guardian)'),

            const SizedBox(height: 40),

            // Loan Calculation Section
            _buildCalculationField('Loan Amount', _amountController),
            _buildDropdownField(
              'Interest',
              ['5%', '10%', '15%'],
              _selectedInterest,
              (val) => setState(() => _selectedInterest = val),
            ),
            _buildCalculationField(
              'Full payment with int.:',
              _fullPayWithIntController,
            ),
            _buildDropdownField(
              'Duration',
              ['5 Weeks', '10 Weeks', '15 Weeks'],
              _selectedDuration,
              (val) => setState(() => _selectedDuration = val),
            ),
            _buildCalculationField(
              'Weekly Payment Amount:',
              _weeklyAmountController,
            ),

            const SizedBox(height: 40),

            // Grant Button
            SizedBox(
              width: 220,
              height: 65,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loan Granted!')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D31FF),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Grant',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSketchField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(label, style: const TextStyle(fontSize: 24)),
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

  Widget _buildCalculationField(
    String label,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedValue,
                  items: items
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: onChanged,
                  isExpanded: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
