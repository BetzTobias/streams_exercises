import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({
    super.key,
    required this.timeRepository,
  });

  final TimeRepository timeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Screen'),
      ),
      body: StreamBuilder<DateTime>(
        stream: timeRepository.dateTimeStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Fehler'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('Keine Daten vorhanden'),
            );
          } else {
            return Center(
              child: Text(
                'Uhrzeit: ${snapshot.data}',
                style: const TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
