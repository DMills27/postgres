#!/bin/env bash
set -eou pipefail

nix --version
cd /workspace
nix build .#psql_15/bin -o psql_15
nix build .#psql_15/docker
nix flake check -L 
nix copy --to s3://nix-postgres-artifacts?secret-key=nix-secret-key ./psql_15
