# CloudPilot: A Self-Service Developer Platform on EKS with Crossplane & Humanitec

Welcome to **CloudPilot**! This repository demonstrates how to build a self-service **Internal Developer Platform (IDP)** on AWS using an EKS cluster, Crossplane, and Humanitec. CloudPilot empowers developers to easily provision cloud resources by simply interacting with a friendly UI.

In this proof-of-concept (PoC), developers can:

- **Deploy an EKS cluster** using eksctl with the provided `cluster.yaml`.
- **Provision managed AWS resources** (like RDS) through Crossplane using simple custom claims.
- **Use Humanitec's UI** to trigger deployments and manage infrastructure in a GitOps workflow.

## Overview

CloudPilot abstracts the complexity of provisioning cloud infrastructure. Instead of manually configuring AWS resources, developers can simply create a `Database` claim to request an AWS RDS instance. Crossplane will then handle the provisioning, while Humanitec’s agent bridges your GitOps workflow and Humanitec's self-service UI.

### Use Case

A development team needs a quick and easy way to provision databases for testing and development. With CloudPilot, developers use the Humanitec UI to trigger a pipeline that applies a `Database` claim, automatically provisioning an RDS instance with the desired configuration.

## Prerequisites

- An AWS account with permissions to create EKS and RDS resources.
- [eksctl](https://eksctl.io/) installed.
- `kubectl` configured to access your AWS account.
- [Helm](https://helm.sh/) installed.
- A Humanitec account and API token.

## Setup Steps

### 1. Create EKS Cluster with eksctl

Use the provided `cluster.yaml` to create your EKS cluster:

```bash
eksctl create cluster -f cluster.yaml
