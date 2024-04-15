// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../../../shared/utils/styles/text_styles/text_styles.dart';

class EmployeeChip extends StatelessWidget {
  final String label;
  final VoidCallback onSelected;
  final VoidCallback onDelete;
  final bool canDelete;

  const EmployeeChip({
    super.key,
    required this.label,
    required this.onSelected,
    required this.onDelete,
    this.canDelete = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: this.onSelected,
      child: Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12),
        onDeleted: this.canDelete ? this.onDelete : null,
        shadowColor: Colors.transparent,
        label: Text(
          'Nome do Conferente',
          style: context.textStyles.subtitle,
        ),
        deleteIcon: Visibility(
          visible: this.canDelete,
          child: const Icon(
            Icons.close,
            color: Colors.red,
            size: 20,
          ),
        ),
      ),
    );
  }
}
