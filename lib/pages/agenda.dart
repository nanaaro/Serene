import 'package:flutter/material.dart';

class AgendaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: ListView.builder(
        itemCount: agendaList.length,
        itemBuilder: (context, index) {
          return _buildAgendaItem(agendaList[index]);
        },
      ),
    );
  }

  Widget _buildAgendaItem(Agenda agenda) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            agenda.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            '${agenda.date} - ${agenda.time}',
            style: TextStyle(fontSize: 16),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
            height: 32,
          ),
        ],
      ),
    );
  }
}

// Model untuk agenda
class Agenda {
  final String name;
  final String date;
  final String time;

  Agenda({required this.name, required this.date, required this.time});
}

// Daftar agenda yang sudah dipesan
List<Agenda> agendaList = [
  Agenda(name: 'Sabrina Zefa', date: '9 July 2024', time: '10.00 AM'),
  Agenda(name: 'John Doe', date: '10 July 2024', time: '11.30 AM'),
  Agenda(name: 'Alice Smith', date: '11 July 2024', time: '2.00 PM'),
];
