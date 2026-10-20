#!/usr/bin/env bash

# Perfil de CPU para jogos no Linux.
# Projeto: https://github.com/aismor/TOTK.git
# Requer root para alterar os controles expostos pelo kernel em /sys.

set -u

if [[ ${EUID:-$(id -u)} -ne 0 ]]; then
    printf 'Erro: execute como root (ex.: sudo %q).\n' "$0" >&2
    exit 1
fi

governors_changed=0
cstates_enabled=0
governors_skipped=0

shopt -s nullglob

for governor_file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
    cpu_dir=${governor_file%/scaling_governor}
    available_file="$cpu_dir/scaling_available_governors"

    if [[ -r $available_file ]] && ! grep -qw performance "$available_file"; then
        printf 'Aviso: governor performance indisponivel em %s.\n' "$cpu_dir" >&2
        ((governors_skipped += 1))
        continue
    fi

    if printf '%s\n' performance >"$governor_file" 2>/dev/null; then
        ((governors_changed += 1))
    else
        printf 'Aviso: nao foi possivel alterar %s.\n' "$governor_file" >&2
        ((governors_skipped += 1))
    fi
done

# Habilita os C-states expostos pelo kernel. Em algumas maquinas isso permite
# que nucleos ociosos durmam e que os nucleos ativos alcancem melhor turbo.
for disable_file in /sys/devices/system/cpu/cpu*/cpuidle/state*/disable; do
    if printf '0\n' >"$disable_file" 2>/dev/null; then
        ((cstates_enabled += 1))
    fi
done

printf 'Perfil aplicado: %d governors em performance; %d C-states habilitados' \
    "$governors_changed" "$cstates_enabled"
if ((governors_skipped > 0)); then
    printf '; %d governors ignorados' "$governors_skipped"
fi
printf '.\n'

if ((governors_changed == 0)); then
    printf 'Aviso: nenhum governor foi alterado. O driver da CPU pode controlar o desempenho automaticamente.\n' >&2
fi
