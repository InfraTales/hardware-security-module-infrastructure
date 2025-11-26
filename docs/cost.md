# Cost Analysis (₹)

Cost estimates for **CloudHSM Infrastructure** in **Indian Rupees (₹)**.

## Production Environment

| Service | Monthly Cost (₹) | Notes |
|---------|------------------|-------|
| **CloudHSM** | ₹120,000–180,000 | Per HSM instance |
| **HA Cluster (2 HSMs)** | ₹240,000–360,000 | Minimum for production |
| **VPC/Networking** | ₹5,000–10,000 | Private subnets |
| **CloudWatch** | ₹3,000–5,000 | Monitoring |
| **Total (HA)** | **₹250,000–380,000** | ~$3,125–4,750/month |

## Key Operations Costs

CloudHSM pricing is per-hour, not per-operation. All cryptographic operations are included.

## Cost Optimization

- **Right-size cluster** – Start with 2 HSMs, scale as needed
- **Multi-tenant** – Share HSM across applications
- **KMS integration** – Use KMS for less sensitive keys
