# Windows E2E tests

These tests verify real Windows desktop behavior and preserve evidence of regressions. See the [workflow](../../../.github/workflows/windows_e2e.yml) for execution settings and the [test files](e2e/) for scenarios and setup requirements.

## Write a regression test

Start each test with a short explanation and links to the issues it guards. Use Given–When–Then to describe the setup, user action, and observable result. The test owns its full lifecycle, including environment preparation, fixtures, assertions, evidence, and cleanup. Keep reusable mechanics in helpers and scenario decisions in the test.

While preparing a pull request, verify that the test fails on the reported defect and passes with the fix. Commit the regression test that checks the corrected behavior; the CI run exercises that test once.

Run tests in a disposable Windows environment. They can change installed applications and desktop state. Read the test's setup requirements before running it locally.

## Review evidence

Download the evidence artifact from the run summary, extract it, and open `index.html`. Review the captures alongside the test results and logs.

Give screenshots and recordings short captions that identify the step and what the viewer should inspect. See the [report helper](helpers/write_evidence_report.ps1) for the caption format and supported media.

## Share icons

The [share-icon regression test](e2e/share_icon.e2e.ps1) builds the candidate installer and checks that the LocalSend logo is visibly rendered in Explorer's Share with menu and the Windows Share picker.
