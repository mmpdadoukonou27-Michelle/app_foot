import 'package:flutter/material.dart';
import 'dart:async'; // Obligatoire pour utiliser les Timers

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  // --- TES VARIABLES ---
  int secondes = 0;
  int score = 0; // Elle manquait ici !
  Timer? monChrono;

  @override
  void initState() {
    super.initState();
    lancerChrono();
  }

  void lancerChrono() {
    monChrono = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        secondes++;
      });
    });
  }

  @override
  void dispose() {
    monChrono?.cancel();
    super.dispose();
  }

  void ajouterPoint() {
    setState(() {
      score = score + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SESSION EN COURS', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // --- BLOC CHRONO (Celui qui manquait) ---
            Column(
              children: [
                const Icon(Icons.timer, size: 40, color: Colors.red),
                Text(
                  '$secondes sec',
                  style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // --- BLOC SCORE ---
            GestureDetector(
              onTap: ajouterPoint,
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red, width: 5),
                ),
                child: Column(
                  children: [
                    Text(
                      '$score',
                      style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const Text('CIBLES HIT', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),

            // --- BOUTON SIMULER ---
            ElevatedButton.icon(
              onPressed: ajouterPoint,
              icon: const Icon(Icons.add),
              label: const Text("SIMULER UN TIR"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
            ),

           // --- BOUTON ARRÊTER ---
ElevatedButton(
  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
  onPressed: () {
    // 1. On arrête le chrono tout de suite
    monChrono?.cancel();

    // 2. On affiche le bilan
    showDialog(
      context: context,
      barrierDismissible: false, // Oblige à cliquer sur le bouton pour fermer
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("BRAVO !"),
          content: Text("Tu as touché $score cibles en $secondes secondes."),
          actions: [
            TextButton(
              child: const Text("RETOUR À L'ACCUEIL"),
              onPressed: () {
                Navigator.pop(context); // Ferme la boîte de dialogue
                Navigator.pop(context); // Ferme la page de session pour revenir à l'accueil
              },
            ),
          ],
        );
      },
    );
  },
  child: const Text('ARRÊTER LA SESSION', style: TextStyle(color: Colors.white)),
)
//ElevatedButton