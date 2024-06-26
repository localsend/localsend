class UserAgentAnalyzer {
  String? getBrowser(String userAgent) {
    if (userAgent.contains('Firefox')) {
      return 'Firefox';
    } else if (userAgent.contains('Chrome')) {
      return 'Chrome';
    } else if (userAgent.contains('Safari')) {
      return 'Safari';
    } else if (userAgent.contains('Opera') || userAgent.contains('OPR')) {
      return 'Opera';
    } else if (userAgent.contains('Edg')) {
      return 'Edge';
    } else if (userAgent.contains('MSIE') || userAgent.contains('Trident')) {
      return 'Internet Explorer';
    } else if (userAgent.contains('insomnia')) {
      return 'Insomnia';
    } else {
      return null;
    }
  }

  String? getOS(String userAgent) {
    if (userAgent.contains('Win')) {
      return 'Windows';
    } else if (userAgent.contains('Android')) {
      return 'Android';
    } else if (userAgent.contains('Macintosh')) {
      return 'macOS';
    } else if (userAgent.contains('iPhone') || userAgent.contains('iPad') || userAgent.contains('iPod')) {
      return 'iOS';
    } else if (userAgent.contains('X11')) {
      return 'Linux';
    } else {
      return null;
    }
  }
}
