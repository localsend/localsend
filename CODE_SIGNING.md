# Code signing policy

Free code signing provided by [SignPath.io](https://signpath.io/), certificate by [SignPath Foundation](https://signpath.org/).

Official Windows release artifacts (portable ZIP, EXE installer, MSIX helper) are built automatically from the source code in the [LocalSend repository](https://github.com/localsend/localsend) using GitHub Actions ([release workflow](.github/workflows/release.yml)) and signed through SignPath. Every signing request is manually approved by an approver listed below.

Only binaries built by LocalSend are signed. Third-party binaries that are packaged with the app are distributed as provided by their upstream projects and do not receive the LocalSend signing operation.

Signed Windows files show **SignPath Foundation** as the publisher because the certificate belongs to the foundation, not to the LocalSend project.

## Team roles

- Committers and reviewers: [@Tienisto](https://github.com/Tienisto)
- Approvers: [@Tienisto](https://github.com/Tienisto)

## Privacy

LocalSend's privacy policy is available at [localsend.org/privacy](https://localsend.org/privacy).
