# LocalSend Protocol v2.1

**English** | [简体中文](./README-zh-CN.md)

The goal is to have a simple REST protocol that does not rely on any external servers.

Because computer networks can be complicated, we cannot assume that every method is available.
Some devices might not support multicast or might not be allowed to have an HTTP server running.

This is why this protocol tries to be "clever" and uses multiple methods to discover and to send files to other LocalSend members.

The protocol only needs one party to set up an HTTP server.

## Table of Contents

- [1. Defaults](#1-defaults)
- [2. Fingerprint](#2-fingerprint)
- [3. Discovery](#3-discovery)
  - [3.1 Multicast](#31-multicast-udp-default)
  - [3.2 HTTP](#32-http-legacy-mode)
- [4. File Transfer](#4-file-transfer-http-aka-upload-api)
  - [4.1 Preparation](#41-preparation-metadata-only)
  - [4.2 Send File](#42-send-file)
  - [4.3 Cancel](#43-cancel)
- [5. Reverse File Transfer](#5-reverse-file-transfer-http-aka-download-api)
  - [5.1 Browser URL](#51-browser-url)
  - [5.2 Receive Request](#52-receive-request-metadata-only)
  - [5.3 Receive File](#53-receive-file)
- [6. Additional API](#6-additional-api)
  - [6.1 Info](#61-info)

## 1. Defaults

LocalSend does not require a specific port or multicast address but instead provides a default configuration.

Everything can be configured in the app settings if the port / address is somehow unavailable.

The default multicast group is 224.0.0.0/24 because some Android devices reject any other multicast group.

**Multicast (UDP)**

- Port: 53317
- Address: 224.0.0.167

**HTTP (TCP)**

- Port: 53317

## 2. Fingerprint

The fingerprint is used to avoid self-discovery and to remember devices.

When encryption is on (HTTPS), then the fingerprint is the SHA-256 hash of the certificate.

When encryption is off (HTTP), then the fingerprint is a random generated string.

## 3. Discovery

### 3.1 Multicast UDP (Default)

**Announcement**

At the start of the app, the following message will be sent to the multicast group:

```json5
{
  "alias": "Nice Orange",
  "version": "2.0", // protocol version (major.minor)
  "deviceModel": "Samsung", // nullable
  "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
  "fingerprint": "random string",
  "port": 53317,
  "protocol": "https", // http | https
  "download": true, // if download API (section 5.2, 5.3) is active (optional, default: false)
  "announce": true
}
```

**Response**

Other LocalSend members will notice this message and will reply with their respective information.

First, an HTTP/TCP request is sent to the origin:

`POST /api/localsend/v2/register`

```json5
{
  "alias": "Secret Banana",
  "version": "2.0",
  "deviceModel": "Windows",
  "deviceType": "desktop",
  "fingerprint": "random string", // ignored in HTTPS mode
  "port": 53317,
  "protocol": "https",
  "download": true, // if download API (section 5.2, 5.3) is active (optional, default: false)
}
```

As fallback, members can also respond with a Multicast/UDP message.

```json5
{
  "alias": "Secret Banana",
  "version": "2.0",
  "deviceModel": "Windows",
  "deviceType": "desktop",
  "fingerprint": "random string",
  "port": 53317,
  "protocol": "https",
  "download": true,
  "announce": false,
}
```

The `fingerprint` is only used to avoid self-discovering.

A response is only triggered when `announce` is `true`.

### 3.2 HTTP (Legacy Mode)

This method should be used when multicast was unsuccessful.

Devices are discovered by sending this request to all local IP addresses.

`POST /api/localsend/v2/register`

Request

```json5
{
  "alias": "Secret Banana",
  "version": "2.0", // protocol version (major.minor)
  "deviceModel": "Windows",
  "deviceType": "desktop",
  "fingerprint": "random string", // ignored in HTTPS mode
  "port": 53317,
  "protocol": "https", // http | https
  "download": true, // if download API (section 5.2, 5.3) is active (optional, default: false)
}
```

Response

```json5
{
  "alias": "Nice Orange",
  "version": "2.0",
  "deviceModel": "Samsung",
  "deviceType": "mobile",
  "fingerprint": "random string", // ignored in HTTPS mode
  "download": true, // if download API (section 5.2, 5.3) is active (optional, default: false)
}
```

## 4. File Transfer (HTTP) aka Upload API

This is the default method.

The receiver setups the HTTP server.

The sender (i.e. HTTP client) sends files to the HTTP server.

### 4.1 Preparation (Metadata Only)

Sends only the metadata to the receiver.

The receiver will decide if this request gets accepted, partially accepted or rejected.

If a PIN is required, the query parameter `?pin=123456` should be added.

`POST /api/localsend/v2/prepare-upload`

Request

```json5
{
  "info": {
    "alias": "Nice Orange",
    "version": "2.0", // protocol version (major.minor)
    "deviceModel": "Samsung", // nullable
    "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
    "fingerprint": "random string", // ignored in HTTPS mode
    "port": 53317,
    "protocol": "https", // http | https
    "download": true, // if download API (section 5.2, 5.3) is active (optional, default: false)
  },
  "files": {
    "some file id": {
      "id": "some file id",
      "fileName": "my image.png",
      "size": 324242, // bytes
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*", // nullable
      "preview": "*preview data*", // nullable
      "metadata": { // nullable
        "modified": "2021-01-01T12:34:56Z", // nullable
        "accessed": "2021-01-01T12:34:56Z", // nullable
      }
    },
    "another file id": {
      "id": "another file id",
      "fileName": "another image.jpg",
      "size": 1234,
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*",
      "preview": "*preview data*"
    }
  }
}
```

Response

```json5
{
  "sessionId": "mySessionId",
  "files": {
    "someFileId": "someFileToken",
    "someOtherFileId": "someOtherFileToken"
  }
}
```

Errors

| HTTP code | Message                            |
|-----------|------------------------------------|
| 204       | Finished (No file transfer needed) |
| 400       | Invalid body                       |
| 401       | PIN required / Invalid PIN         |
| 403       | Rejected                           |
| 409       | Blocked by another session         |
| 429       | Too many requests                  |
| 500       | Unknown error by receiver          |

### 4.2 Send File

The file transfer.

Use the `sessionId`, the `fileId` and its file-specific `token` from [`/prepare-upload`](#41-preparation-metadata-only).

This route can be called in parallel.

`POST /api/localsend/v2/upload?sessionId=mySessionId&fileId=someFileId&token=someFileToken`

Request

```text
Binary data
```

Response

```text
No body
```

Errors

| HTTP code | Message                     |
|-----------|-----------------------------|
| 400       | Missing parameters          |
| 403       | Invalid token or IP address |
| 409       | Blocked by another session  |
| 500       | Unknown error by receiver   |

### 4.3 Cancel

This route will be called when the sender wants to cancel the session.

Use the `sessionId` from [`/prepare-upload`](#41-preparation-metadata-only).

`POST /api/localsend/v2/cancel?sessionId=mySessionId`

Response

```text
No body
```

## 5. Reverse File Transfer (HTTP) aka Download API

This is an alternative method which should be used when LocalSend is not available on the receiver.

The sender setups an HTTP server to send files to other members by providing a URL.

The receiver then opens the browser with the given URL and downloads the file.

It is important to note that the unencrypted HTTP protocol is used because browsers reject self-signed certificates.

### 5.1 Browser URL

The receiver can open the following URL in the browser to download the file.

```text
http://<sender-ip>:<sender-port>
```

### 5.2 Receive Request (Metadata Only)

Send to the sender a request to get a list of file metadata.

The downloader may add `?sessionId=mySessionId`. In this case, the request should be accepted if it is the same session.

This is needed if the user refreshes the browser page.

If a PIN is required, the query parameter `?pin=123456` should be added.

`POST /api/localsend/v2/prepare-download`

Request

```text
No body
```

Response

```json5
{
  "info": {
    "alias": "Nice Orange",
    "version": "2.0",
    "deviceModel": "Samsung", // nullable
    "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
    "fingerprint": "random string", // ignored in HTTPS mode
    "download": true, // if download API (section 5.2, 5.3) is active (optional, default: false)
  },
  "sessionId": "mySessionId",
  "files": {
    "some file id": {
      "id": "some file id",
      "fileName": "my image.png",
      "size": 324242, // bytes
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*", // nullable
      "preview": "*preview data*" // nullable
    },
    "another file id": {
      "id": "another file id",
      "fileName": "another image.jpg",
      "size": 1234,
      "fileType": "image/jpeg",
      "sha256": "*sha256 hash*",
      "preview": "*preview data*"
    }
  }
}
```

Errors

| HTTP code | Message                    |
|-----------|----------------------------|
| 401       | PIN required / Invalid PIN |
| 403       | Rejected                   |
| 429       | Too many requests          |
| 500       | Unknown error by sender    |

### 5.3 Receive File

The file transfer.

Use the `sessionId`, the `fileId` from [`/prepare-download`](#52-receive-request-metadata-only).

This route can be called in parallel.

`GET /api/localsend/v2/download?sessionId=mySessionId&fileId=someFileId`

Request

```text
No body
```

Response

```text
Binary data
```

## 6. Additional API

### 6.1 Info

This was an old route previously used for discovery. This has been replaced with `/register` which is a two-way discovery.

Now this route should be only used for debugging purposes.

`GET /api/localsend/v2/info`

Response

```json5
{
  "alias": "Nice Orange",
  "version": "2.0",
  "deviceModel": "Samsung", // nullable
  "deviceType": "mobile", // mobile | desktop | web | headless | server, nullable
  "fingerprint": "random string",
  "download": true, // if download API (section 5.2, 5.3) is active (optional, default: false)
}
```

## 7. Enums

In this project, enums are used to define the possible values of some fields.

### 7.1 Device Type

Device types are only used for UI purposes like showing an icon.

There is no difference in the protocol between the different device types.

| Value    | Description                               |
|----------|-------------------------------------------|
| mobile   | mobile device (Android, iOS, FireOS)      |
| desktop  | desktop (Windows, macOS, Linux)           |
| web      | web browser (Firefox, Chrome)             |
| headless | program without GUI running on a terminal |
| server   | (self-hosted) cloud service running 24/7  |

The implementation handle unknown values. The official implementation falls back to `desktop`.
