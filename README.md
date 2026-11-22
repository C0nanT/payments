# Payments (work in progress)

**A production-grade payments backend in Go: six microservices on Kubernetes, built around a double-entry ledger, sagas, events, observability and chaos tests.**

![Go](https://img.shields.io/badge/Go-1.25-00ADD8?logo=go&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-4169E1?logo=postgresql&logoColor=white)
![NATS](https://img.shields.io/badge/NATS-JetStream-27AAE1?logo=natsdotio&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-ready-326CE5?logo=kubernetes&logoColor=white)
![Status](https://img.shields.io/badge/status-work%20in%20progress-orange)

> Money is the one thing a backend is never allowed to get wrong. This project is an end-to-end exercise in building a payments system where **the numbers always add up**, even under concurrency, retries, crashes and infrastructure failures.

## What this project is about

- **A ledger that refuses bad money.** A double-entry ledger in PostgreSQL where every transaction must balance. Entries that don't add up are rejected by the database itself.
- **Safe money movement under concurrency.** Row-level locks, idempotency keys and sagas keep transfers correct when requests race, retry or fail halfway.
- **Services that talk reliably.** Go microservices connected through gRPC, an API gateway and NATS JetStream events.
- **Observable, tested, shippable.** OpenTelemetry, testcontainers, k6 load tests, distroless images and CI.
- **Proven resilience.** Deployed on Kubernetes and attacked with chaos tests to show that no money is ever lost.

## Architecture

The system is a set of Go microservices that talk to each other synchronously (gRPC) and asynchronously (NATS JetStream events), with PostgreSQL as the source of truth for money. The detailed design is still being decided and will be documented as the services are built.

## Built without AI-generated code

This project is written **without AI code generation**. The goal is to practice and sharpen programming skills by designing and implementing every piece by hand.

## Tech stack

| Area | Technology |
| --- | --- |
| Language | Go |
| Database | PostgreSQL 17 (double-entry ledger, row locks) |
| Cache | Redis 8 |
| Messaging | NATS JetStream |
| RPC | gRPC, API gateway |
| Observability | OpenTelemetry |
| Testing | testcontainers, k6, chaos tests |
| Packaging / CI | distroless images, CI pipeline |
| Runtime | Kubernetes |

## License

This project is licensed under the [MIT License](LICENSE).
