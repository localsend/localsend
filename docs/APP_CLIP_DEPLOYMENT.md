# iOS App Clip deployment

The app source is configured for the production invocation prefix `https://localsend.org/clip`, App Clip bundle ID `org.localsend.localsendApp.Clip`, parent bundle ID `org.localsend.localsendApp`, Apple Team ID `3W7H4PYMCV`, and associated domain `appclips:localsend.org`.

## 1. Deploy the website companion

Merge and deploy the companion `localsend/website` change that provides:

- `https://localsend.org/clip`, including the App Clip card metadata for App Store ID `1661733229`;
- `https://localsend.org/.well-known/apple-app-site-association`, with `3W7H4PYMCV.org.localsend.localsendApp.Clip` under `appclips.apps`;
- `Content-Type: application/json` and no redirect for the AASA response;
- `Referrer-Policy: no-referrer` and `Cache-Control: no-store` for `/clip`.

After deployment, verify the real responses:

```bash
curl -i https://localsend.org/.well-known/apple-app-site-association
curl -i https://localsend.org/clip
```

The first response must be HTTP 200, must not redirect, and must contain the exact App Clip identifier. The second must be HTTP 200 and contain `app-clip-bundle-id=org.localsend.localsendApp.Clip`.

## 2. Configure Apple identifiers and capabilities

In Certificates, Identifiers & Profiles:

1. Keep the parent App ID `org.localsend.localsendApp` and enable Associated Domains and Hotspot Configuration for the installed-app fallback.
2. Register the App Clip ID `org.localsend.localsendApp.Clip` under that parent.
3. Enable On Demand Install Capable, Associated Domains, and Hotspot Configuration for the App Clip ID.
4. Regenerate the parent and App Clip provisioning profiles after changing capabilities.

The checked-in entitlements require the same values. Do not change only the portal or only the project.

## 3. Configure App Store Connect

After uploading a build containing `LocalSendClip`:

1. Create the required default App Clip experience.
2. Use `https://localsend.org/clip` as its associated website invocation URL.
3. Provide the required 1800 x 1200 (3:2) header image, a subtitle of at most 56 characters, and the `View` or `Open` action.
4. Confirm App Store Connect reports the AASA association as valid.

Registering the `/clip` prefix covers the per-session query parameters because App Clip experiences use URL-prefix matching.

## 4. Build-time overrides

Production defaults are checked in. Staging can override them without editing source:

- Android: `-PappClipInvocationBaseUrl=https://host/path`
- Xcode: `APP_CLIP_INVOCATION_BASE_URL=https://host/path APP_CLIP_ASSOCIATED_DOMAIN=appclips:host`

The Android and iOS values must name the same HTTPS origin and path. Both parsers reject a mismatched or malformed invitation.

## 5. Release verification

Before enabling the Android Receive action in a release:

1. Run the macOS App Clip workflow and archive the parent app with its embedded clip.
2. Test the launch experience in TestFlight or with an Xcode Local Experience.
3. On a physical Android/iPhone pair, exercise NFC and QR invocation, media selection, hotspot approval, Android acceptance/decline, full transfer, cancellation, failed-file retry, background teardown, and the installed-full-app fallback.
4. Verify App Clip Diagnostics on iPhone reports no AASA or experience mismatch.

The invocation query is a short-lived bearer capability containing hotspot credentials and a session key. App code does not log or persist it, and the website fallback removes it from browser history after hydration. Its initial HTML and response headers disable referrer propagation. Deployment operators must also ensure CDN/origin access logs do not retain query strings.
