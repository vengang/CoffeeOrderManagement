import 'package:coffeeapp/const/appColor.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,

        title: Text(
          "Profile",
          style: TextStyle(
            color: Appcolor.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Appcolor.tertiary,
                              width: 3,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                              "https://i.pinimg.com/736x/f1/7d/db/f17ddb244e3f2f6a720e61cd3f8161fb.jpg",
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Appcolor.primary,
                          child: Icon(
                            Icons.edit_outlined,
                            size: 18,
                            color: Appcolor.surface,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14),
                    Text(
                      "Alex Mercer",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "alex.mercer@example.com",
                      style: TextStyle(
                        fontSize: 14,
                        color: Appcolor.textSecondary,
                      ),
                    ),
                    SizedBox(height: 14),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor.surface,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Appcolor.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text(
                "ACCOUNT",
                style: TextStyle(
                  color: Appcolor.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Appcolor.surface,
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.history, color: Appcolor.textPrimary),
                      title: Text("Order History"),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Appcolor.textSecondary,
                      ),
                      onTap: () {},
                    ),
                    Divider(height: 1, indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.payment, color: Appcolor.textPrimary),
                      title: Text("Payment Methods"),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Appcolor.textSecondary,
                      ),
                      onTap: () {},
                    ),
                    Divider(height: 1, indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(
                        Icons.notifications_none,
                        color: Appcolor.textPrimary,
                      ),
                      title: Text("Notifications"),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Appcolor.textSecondary,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                "PREFERENCES",
                style: TextStyle(
                  color: Appcolor.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Appcolor.surface,
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        color: Appcolor.textPrimary,
                      ),
                      title: Text("Language"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "English",
                            style: TextStyle(color: Appcolor.textSecondary),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.chevron_right,
                            color: Appcolor.textSecondary,
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    Divider(height: 1, indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(
                        Icons.dark_mode_outlined,
                        color: Appcolor.textPrimary,
                      ),
                      title: Text("Dark Mode"),
                      trailing: Switch(value: false, onChanged: (val) {}),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                "SUPPORT",
                style: TextStyle(
                  color: Appcolor.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 10),
              Material(
                color: Appcolor.surface,
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    color: Appcolor.textPrimary,
                  ),
                  title: Text("Help & Support"),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Appcolor.textSecondary,
                  ),
                  onTap: () {},
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: Colors.redAccent, size: 20),
                  label: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
