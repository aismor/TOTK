#!/usr/bin/env bash

set -euo pipefail

if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
    printf 'Erro: execute este instalador com sudo.\n' >&2
    exit 1
fi

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
install -Dm755 "$script_dir/cpu-perf-max.sh" /usr/local/sbin/cpu-perf-max

if command -v systemctl >/dev/null 2>&1 && [[ -d /run/systemd/system ]]; then
    install -Dm644 "$script_dir/cpu-perf-max.service" /etc/systemd/system/cpu-perf-max.service
    systemctl daemon-reload
    systemctl enable --now cpu-perf-max.service
    printf 'Servico cpu-perf-max instalado, ativado e iniciado.\n'
else
    printf 'Systemd nao detectado. Script instalado em /usr/local/sbin/cpu-perf-max.\n'
    printf 'Execute-o como root na inicializacao usando o gerenciador da sua distribuicao.\n'
fi
