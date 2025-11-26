# Security Overview

Security posture of **CloudHSM Infrastructure**.

## FIPS 140-2 Level 3

- Tamper-evident hardware
- Identity-based authentication
- Physical security controls
- Zeroization on tamper detection

## Key Management

- **Key ceremony**: Documented procedures
- **Quorum authentication**: M-of-N approval
- **Key backup**: Encrypted, secure storage
- **Audit logging**: All operations logged

## Access Controls

- **Crypto users**: Application access
- **Crypto officers**: Key management
- **HSM admins**: Cluster management
- **MFA required**: For all admin access

## Compliance

- PCI-DSS Level 1
- HIPAA
- FedRAMP High
- SOC 2 Type II

> See `SECURITY.md` for key ceremony procedures.
