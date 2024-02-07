import 'package:flutter/material.dart';
import 'package:mongo_test/models/patients.dart';

class UserCard extends StatelessWidget {
  UserCard(
      {required this.user, required this.onTapDelete, required this.onTapEdit});
  final User user;
  final void Function() onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: Text(
          '${user.patientName}',
          style: Theme.of(context).textTheme.headline6,
        ),
        trailing: PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: GestureDetector(
                child: Row(
                  children: [Icon(Icons.edit), Text('Edit')],
                ),
                onTap: onTapEdit,
              ),
            ),
            PopupMenuItem(
              child: GestureDetector(
                child: Row(
                  children: [Icon(Icons.delete), Text('Delete')],
                ),
                onTap: onTapDelete,
              ),
            ),
          ],
          onSelected: (value) {
            // // Handle option selection
            // print("Selected option: $value");
          },
        ),
      ),
    );
  }
}
