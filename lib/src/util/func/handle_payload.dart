import 'package:flutter/material.dart'
    show BuildContext, ScaffoldMessenger, SnackBar;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/services.dart';

String _buildEmail(String payload) =>
    "mailto:$payload?subject=Hello%20G&body=Nigga%20wanna%20see%20me%20fall";

void handlePayload(String payload, BuildContext context, SnackBar snackBar) {
  switch (payload) {
    case "link":
      launchUrl(Uri.parse(payload));
      break;
    case "mail":
      launchUrlString(_buildEmail(payload));
      break;
    default:
      Clipboard.setData(ClipboardData(text: payload));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      break;
  }
}
