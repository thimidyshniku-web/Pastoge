# Cloud build plan (first milestone)

## 1. Provision
Ubuntu 24.04 x86_64, 64–128 GB RAM, 16–32 vCPUs, 500 GB–1 TB SSD. Use a cloud provider with nested virtualization/KVM support if you intend to **run** Cuttlefish on that same VM; compilation alone does not require KVM. Restrict SSH access to your IP, use SSH keys and enable disk encryption if offered.

## 2. Prepare
Clone the Pastoge repository and run:
```bash
bash secura-os/scripts/bootstrap-ubuntu.sh
```
Review `secura-os/config/aosp.env`. Release tags and lunch targets must be compatible. If the selected target is absent, select a documented Cuttlefish target for that AOSP tag; do not assume a target exists across releases.

## 3. Sync and compile
```bash
bash secura-os/scripts/sync-and-build.sh
```
The script clones AOSP into `~/secura-build/aosp`, not into this GitHub repository. Expect a large download, hours of compile time and substantial disk usage.

## 4. Test
Run Cuttlefish using the official documentation on a KVM-capable host. Check boot, ADB connectivity, SELinux enforcing and basic networking. Capture build logs, AOSP revision, target and test results. A successful compile is **not** a security audit.

## 5. Future milestones
1. Reproducible CI and build artifact retention in dedicated cloud storage.
2. SECURA launcher and branding in a dedicated AOSP source overlay.
3. Reviewed messaging protocol integration, identity/key management and server deployment.
4. Device-specific port with verified boot, locked bootloader and rollback protection.
5. Signed OTA, independent security review and controlled pilot.

## Guardrails
- No secrets or signing keys in GitHub.
- No customer or production use before security testing.
- Do not disable verified boot, SELinux or Android sandboxing.
- Use the existing Flutter messenger only as a UI prototype until cryptographic messaging is independently validated.

## References
- https://source.android.com/docs/setup/start/requirements
- https://source.android.com/docs/setup/download
- https://source.android.com/docs/setup/build/building
- https://source.android.com/docs/devices/cuttlefish/get-started
