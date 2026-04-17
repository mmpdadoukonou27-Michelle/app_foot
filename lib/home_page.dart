import 'package:flutter/material.dart';
import 'session_page.dart';

// --- ÉCRAN D'ACCUEIL ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barre du haut Rouge
      appBar: AppBar(
        title: const Text(
          'FOOT\'APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[700],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // En-tête avec message de bienvenue
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Text(
              'Prêt pour l\'entraînement ?',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),

          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(20),
              crossAxisCount: 2, // 2 colonnes
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                // Bouton Session (Priorité MVP)
                _buildMenuCard(
                  context,
                  'Démarrer Session',
                  Icons.play_circle_fill,
                  Colors.red,
                ),
                // Bouton Historique (Priorité MVP)
                _buildMenuCard(
                  context,
                  'Historique',
                  Icons.history,
                  Colors.grey[800]!,
                ),
                // Bouton Cibles/Modules
                _buildMenuCard(
                  context,
                  'Modules',
                  Icons.settings_remote,
                  Colors.grey[800]!,
                ),
                // Bouton Profil
                _buildMenuCard(
                  context,
                  'Mon Profil',
                  Icons.account_circle,
                  Colors.grey[800]!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Petit outil pour créer les boutons du menu rapidement
  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        // Logique de navigation à ajouter ici
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SessionPage()),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
