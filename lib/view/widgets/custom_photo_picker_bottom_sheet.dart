import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



///custom photo picker when a will be tapped this widget will come from down with gallery
///and camera option and can choose where want to take the photo
Future<void> customPhotoPickerBottomSheet({
  required BuildContext context,
  required VoidCallback onGalleryTap,
  required VoidCallback onCameraTap,
}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.image),
                  TextButton(
                    child: const Text('Gallery'),
                    onPressed: () {
                      Navigator.pop(context);
                      onGalleryTap();
                    },
                  ),
                ],
              ),
            ),
            // const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.camera_alt),
                  TextButton(
                    child: const Text('Camera'),
                    onPressed: () {
                      Navigator.pop(context);
                      onCameraTap();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
