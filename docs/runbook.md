# Runbook

## Deployment

```bash
npm install && cdk deploy --context environment=prod
```

## Key Ceremony

1. Gather quorum of key custodians
2. Initialize HSM cluster
3. Generate master keys
4. Distribute key shares
5. Document and secure

## Adding HSM to Cluster

```bash
aws cloudhsmv2 create-hsm \
  --cluster-id cluster-xxx \
  --availability-zone us-east-1a
```

## Application Integration

```bash
# Install CloudHSM client
sudo yum install cloudhsm-client

# Configure PKCS#11
/opt/cloudhsm/bin/configure -a <HSM_IP>
```

## Maintenance

- Monitor HSM health daily
- Rotate keys per policy
- Test backup/restore quarterly
- Review audit logs weekly
