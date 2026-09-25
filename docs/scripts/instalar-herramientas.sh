#!/usr/bin/env bash
# Instala las herramientas necesarias para seguir el curso de IaC con Terraform.
# Pensado para macOS con Homebrew. Es idempotente: no reinstala lo que ya existe.
#
# Uso, desde la raíz del repositorio:
#   ./docs/scripts/instalar-herramientas.sh

set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Este script instala las herramientas con Homebrew y solo está preparado para macOS." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew no está instalado. Instálalo desde https://brew.sh y vuelve a ejecutar este script." >&2
  exit 1
fi

# Fórmulas de Homebrew y para qué las usa el curso.
#   git — versionar apuntes, módulos y el estado del repositorio
#   gh  — trabajar con el repositorio en GitHub
formulas=(
  git
  gh
)

for formula in "${formulas[@]}"; do
  if brew list --formula "${formula}" >/dev/null 2>&1; then
    echo "${formula} ya está instalado."
  else
    echo "Instalando ${formula}..."
    brew install "${formula}"
  fi
done

# Terraform salió de Homebrew core. Se instala desde el tap oficial de HashiCorp.
if brew list --formula terraform >/dev/null 2>&1; then
  echo "terraform ya está instalado."
else
  echo "Instalando terraform..."
  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform
fi

echo
echo "Herramientas del curso:"
git --version
gh --version
terraform version
