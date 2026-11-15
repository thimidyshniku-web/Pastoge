# SECURA OS — AOSP development workspace

SECURA OS is an experimental Android Open Source Project (AOSP) derivative for secure communications.

**Status:** configuration and documentation only. No custom OS image, device port, security audit, or production release exists yet.

## Scope
- Build an unmodified upstream AOSP emulator target first.
- Develop a custom launcher, messaging integration, security policy and OTA infrastructure in later milestones.
- Keep the existing SECURA Flutter app in `secura/android/` untouched.
- Do not put AOSP source trees, build outputs, signing keys or secrets in this repository.

## Quick start
1. Provision Ubuntu 24.04 x86_64 cloud VM with >=64 GB RAM, >=16 vCPUs and >=500 GB fast SSD (1 TB preferred).
2. Read [docs/cloud-build.md](docs/cloud-build.md).
3. Run `bash secura-os/scripts/bootstrap-ubuntu.sh` from the repository root to install build dependencies.
4. Run `bash secura-os/scripts/sync-and-build.sh` to sync the pinned AOSP tag and build the Cuttlefish virtual device.
5. Follow the official Cuttlefish documentation to run the resulting image on a compatible KVM host.

## Security
Never use test signing keys for commercial builds. Do not disable SELinux, verified boot or rollback protections. The eventual messenger must use a reviewed E2EE protocol; a PIN alone is not encryption.

## Repository
This is a public repository. Do not commit cloud credentials, private keys, device identifiers or customer data.
