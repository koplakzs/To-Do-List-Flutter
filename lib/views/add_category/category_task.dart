import 'package:flutter/material.dart';
import 'package:to_do_list/views/my_theme.dart';

class CategoryTask extends StatelessWidget {
  final String title, icon;
  const CategoryTask({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> iconParts = icon.split(".");
    IconData iconData = Icons.error; // Ikon default jika terjadi kesalahan

    if (iconParts.length == 2) {
      try {
        int iconCode = int.parse(iconParts[1], radix: 16);
        iconData = IconData(0xe25b, fontFamily: 'MaterialIcons');
      } on FormatException {
        // Terjadi kesalahan ketika mengonversi kode ikon menjadi bilangan bulat
        print('Kesalahan: Kode ikon tidak valid');
      }
    } else {
      // Terjadi kesalahan dalam format string ikon
      print('Kesalahan: Format string ikon salah');
    }
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black12,
            backgroundColor: MyTheme.white,
            shadowColor: MyTheme.grey,
            elevation: 10, // Ketebalan bayangan
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: () => {},
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          height: 70,
          child: Row(
            children: [
              Icon(
                iconData,
                size: 30,
                color: Color.fromARGB(255, 52, 221, 5),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'poppins', fontSize: 18, color: Colors.black),
              )
            ],
          ),
        ));
  }
}
