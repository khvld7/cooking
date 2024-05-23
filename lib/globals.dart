import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';

launchURL() async {
  final Uri url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

markApp() async {
  final InAppReview inAppReview = InAppReview.instance;
  if (await inAppReview.isAvailable()) {
    inAppReview.openStoreListing(appStoreId: '...', microsoftStoreId: '...');
  }
}
