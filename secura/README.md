# SECURA — Android test build

This is an **interface-only Android test build**, not a secure messenger yet. No real messages, account registration, PIN, subscriptions, or E2EE are enabled in this build.

## Build from a phone using GitHub Actions

Open Actions > SECURA Android APK (test) > Run workflow. After a successful build, open the workflow run and download the `SECURA-Android-debug-APK` artifact ZIP. Extract `app-debug.apk` and install it on Android if you trust the source.

This repository is **public**. Never commit passwords, signing keys, production credentials, or private encryption keys.

## Next engineering stages

1. Implement a separately deployed FastAPI ciphertext relay with TLS, persistent accounts, authorization, expiry and abuse controls.
2. Integrate an audited E2EE protocol with authenticated key verification and forward secrecy, then perform security review.
3. Add local PIN unlock, account expiry, subscription billing and operational monitoring.

Do not use this prototype for confidential communication.
