#!/usr/bin/env bash

# Inicializador simples do Eden com MangoHud selecionavel e GameMode opcional.
# Funciona com GPUs NVIDIA, AMD e Intel.

set -u

die() {
    printf 'Erro: %s\n' "$*" >&2
    exit 1
}

ensure_directory() {
    local directory="$1"

    if [[ -e $directory && ! -d $directory ]]; then
        die "$directory existe, mas nao e uma pasta"
    fi

    if [[ ! -d $directory ]]; then
        mkdir -p "$directory" || die "nao foi possivel criar a pasta $directory"
    fi
}

install_launcher() {
    local target="$HOME/.local/bin/eden-gaming"
    local desktop="$HOME/.local/share/applications/eden-gaming.desktop"
    local icon_dir="$HOME/.local/share/icons/hicolor/scalable/apps"
    local icon="$icon_dir/eden-gaming.svg"
    local icon_tmp="${icon}.tmp.$$"
    local icon_url="https://git.eden-emu.dev/assets/img/logo.svg"

    ensure_directory "${target%/*}"
    ensure_directory "${desktop%/*}"
    ensure_directory "$icon_dir"

    install -m 755 "$(readlink -f "$0")" "$target" \
        || die "nao foi possivel instalar $target"

    if command -v curl >/dev/null 2>&1; then
        curl --fail --location --silent --show-error \
            --output "$icon_tmp" "$icon_url" \
            || { rm -f "$icon_tmp"; die "nao foi possivel baixar o icone do Eden"; }
    elif command -v wget >/dev/null 2>&1; then
        wget --quiet --output-document="$icon_tmp" "$icon_url" \
            || { rm -f "$icon_tmp"; die "nao foi possivel baixar o icone do Eden"; }
    else
        die "curl ou wget e necessario para baixar o icone do Eden"
    fi

    install -m 644 "$icon_tmp" "$icon" \
        || { rm -f "$icon_tmp"; die "nao foi possivel instalar $icon"; }
    rm -f "$icon_tmp"

    cat >"$desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Eden Gaming
GenericName=Switch Emulator
Comment=Abre o Eden com painel de FPS opcional e GameMode
Exec=$target
Icon=eden-gaming
Terminal=false
Categories=Game;Emulator;
Keywords=Eden;Nintendo;Switch;FPS;MangoHud;
StartupNotify=true
EOF

    chmod 644 "$desktop"
    if command -v update-desktop-database >/dev/null 2>&1; then
        update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true
    fi
    if command -v gtk-update-icon-cache >/dev/null 2>&1; then
        gtk-update-icon-cache --force "$HOME/.local/share/icons/hicolor" >/dev/null 2>&1 || true
    fi

    printf 'Instalado com sucesso. Procure por "Eden Gaming" no menu de aplicativos.\n'
}

if [[ ${1:-} == "--install" ]]; then
    install_launcher
    exit 0
fi

find_eden() {
    # Permite informar manualmente o executavel:
    # EDEN_EXECUTABLE=/caminho/Eden.AppImage ./eden-gaming-simples.sh
    if [[ -n ${EDEN_EXECUTABLE:-} && -x ${EDEN_EXECUTABLE} ]]; then
        printf '%s\n' "$EDEN_EXECUTABLE"
        return
    fi

    local candidate
    for candidate in \
        "$HOME/Applications/Eden.AppImage" \
        "$HOME/Applications/eden.AppImage" \
        "$HOME/Emulation/tools/launchers/Eden.AppImage"; do
        if [[ -x $candidate ]]; then
            printf '%s\n' "$candidate"
            return
        fi
    done

    if command -v eden >/dev/null 2>&1; then
        command -v eden
        return
    fi

    # Procura outros AppImages comuns sem varrer todo o disco.
    for candidate in "$HOME/Applications"/Eden*.AppImage "$HOME"/Eden*.AppImage; do
        if [[ -f $candidate ]]; then
            chmod +x "$candidate" 2>/dev/null || true
            if [[ -x $candidate ]]; then
                printf '%s\n' "$candidate"
                return
            fi
        fi
    done

    return 1
}

eden=$(find_eden) || die "Eden nao encontrado. Defina EDEN_EXECUTABLE com o caminho correto."

ask_show_fps() {
    if [[ -n ${DISPLAY:-}${WAYLAND_DISPLAY:-} ]] && command -v zenity >/dev/null 2>&1; then
        zenity --question \
            --title="Eden Gaming" \
            --text="Mostrar FPS?" \
            --ok-label="Sim" \
            --cancel-label="Não"
        return
    fi

    if [[ -n ${DISPLAY:-}${WAYLAND_DISPLAY:-} ]] && command -v kdialog >/dev/null 2>&1; then
        kdialog --title "Eden Gaming" --yesno "Mostrar FPS?"
        return
    fi

    if [[ -t 0 ]]; then
        local answer
        while true; do
            read -r -p "Mostrar FPS? [s/n] " answer
            case ${answer,,} in
                s|sim) return 0 ;;
                n|nao|não) return 1 ;;
                *) printf 'Responda s para Sim ou n para Não.\n' ;;
            esac
        done
    fi

    printf 'Aviso: interface de pergunta indisponivel; abrindo sem mostrar FPS.\n' >&2
    return 1
}

command=("$eden" "$@")

if ask_show_fps; then
    if command -v mangohud >/dev/null 2>&1; then
        # Toda a configuracao do overlay fica neste arquivo unico.
        export MANGOHUD=1
        export MANGOHUD_CONFIG='position=top-left,font_size=22,background_alpha=0.35,round_corners=6,fps,frametime,frame_timing,cpu_stats,cpu_temp,cpu_mhz,cpu_load_change,gpu_stats,gpu_temp,gpu_core_clock,gpu_power,gpu_load_change,vram,ram,toggle_hud=Shift_R+F12'
        command=(mangohud "${command[@]}")
    else
        printf 'Aviso: MangoHud nao encontrado; Eden sera aberto sem o painel de FPS.\n' >&2
    fi
fi

if command -v gamemoderun >/dev/null 2>&1; then
    command=(gamemoderun "${command[@]}")
fi

printf 'Abrindo Eden: %s\n' "$eden"
exec "${command[@]}"
