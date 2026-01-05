import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lexi/features/add_words/presentation/pages/scan_camera_screen.dart';

import '../../../../l10n/app_localizations.dart';
import '../widgets/drag_handle.dart';
import '../widgets/method_tile.dart';
import 'manual_input_screen.dart';

class AddWordsMethodBottomSheet extends StatelessWidget {
  const AddWordsMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF161822),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DragHandle(),
            const SizedBox(height: 16),

            Text(
              l10n?.addWords ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            MethodTile(
              icon: Icons.camera_alt,
              title: l10n?.scanFromPhoto ?? '',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ScanCameraScreen(),
                  ),
                );
              },
            ),
            MethodTile(
              icon: Icons.edit,
              title: l10n?.addManually ?? '',
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) {
                      return const AddManuallyBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


