# TOTK Mods para Eden — jogo 1.2.1

Coleção final de mods testados no **The Legend of Zelda: Tears of the Kingdom
1.2.1**, Title ID `0100F2C0115B6000`, usando o emulador Eden.

> Este projeto está concluído e não possui suporte planejado para outras
> versões do jogo. Instale somente um perfil UltraCam.

## Downloads individuais

| Mod | Função | Download |
|---|---|---|
| Bateria infinita | Impede o consumo da bateria Zonai | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-bateria-infinita-totk-1.2.1.zip) |
| Bônus de comida infinito | Impede que o temporizador dos efeitos termine | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-bonus-comida-infinito-totk-1.2.1.zip) |
| Coleta 8× | Cada item coletado rende oito unidades | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-coleta-8x-totk-1.2.1.zip) |
| Comida infinita | Impede o consumo de comidas | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-comida-infinita-totk-1.2.1.zip) |
| Dispositivos Zonai infinitos | Impede o consumo dos dispositivos no inventário | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-dispositivos-zonai-infinitos-totk-1.2.1.zip) |
| Durabilidade infinita | Evita a perda normal de durabilidade | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-durabilidade-infinita-totk-1.2.1.zip) |
| Flechas infinitas | Impede o consumo de flechas | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-flechas-infinitas-totk-1.2.1.zip) |
| UltraCam 30 FPS | Perfil leve em 720p para computadores mais fracos | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-ultracam-30fps-pc-fraco-totk-1.2.1.zip) |
| UltraCam 60 FPS | Perfil de 60 FPS dinâmicos em 1080p | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-ultracam-60fps-totk-1.2.1.zip) |
| Mira sem desfoque | Remove a profundidade de campo ao mirar | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-mira-sem-desfoque-totk-1.2.1.zip) |
| Névoa reduzida | Melhora a visibilidade reduzindo a névoa persistente | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-nevoa-reduzida-totk-1.2.1.zip) |
| Compras gratuitas | Não desconta rupees quando o saldo cobre o preço | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-compras-gratuitas-totk-1.2.1.zip) |
| Sombras 512 | Reduz a resolução das sombras para melhorar desempenho | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-sombras-512-totk-1.2.1.zip) |
| Super pulo | Aumenta a altura do pulo | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-super-pulo-totk-1.2.1.zip) |
| Tradução e dublagem PT-BR | Trabalho original da Equipe Triforce Heroes | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/triforce-heroes-traducao-dublagem-ptbr-totk-1.2.1.zip) |
| Vida infinita | Impede a perda normal de vida | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-vida-infinita-totk-1.2.1.zip) |
| Vigor do cavalo infinito | Impede o consumo do vigor do cavalo | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-vigor-cavalo-infinito-totk-1.2.1.zip) |
| Vigor infinito | Impede o consumo do vigor de Link | [ZIP](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-vigor-infinito-totk-1.2.1.zip) |

## Coleção completa

- [Coleção completa sem mod de FPS](https://github.com/aismor/TOTK/releases/download/v1.0.0/aismor-colecao-completa-totk-1.2.1.zip)

O pacote completo possui uma pasta com o Title ID para cópia manual. Ele inclui
a tradução/dublagem da Equipe Triforce Heroes, mas não inclui UltraCam, outro
mod de FPS ou shaders. Instale separadamente apenas um dos perfis UltraCam de
30 ou 60 FPS disponíveis nos downloads individuais.

## Instalação individual

1. Abra o Eden e selecione o TOTK.
2. Abra o gerenciador de mods do jogo.
3. Escolha a opção para instalar um mod compactado.
4. Selecione o ZIP desejado e ative o mod.
5. Reinicie o jogo.

O UltraCam também contém a pasta `sdmc`. Caso o instalador não a copie,
transfira seu conteúdo para a pasta `sdmc` do Eden, preservando a estrutura.

## Eden Gaming — inicializador com FPS

O repositório também inclui o inicializador simplificado:

```text
eden-gaming/eden-gaming-simples.sh
```

Ele localiza o Eden, pergunta se você deseja mostrar FPS e usa GameMode quando
disponível. Ao escolher **Sim**, abre o emulador com MangoHud; ao escolher
**Não**, abre normalmente, sem o painel. O painel funciona com GPUs NVIDIA,
AMD e Intel e pode mostrar FPS, frametime, uso, temperatura e clocks conforme
o suporte do driver.

Instale o MangoHud pela sua distribuição e depois execute:

### Instalação do MangoHud

**Fedora:**

```bash
sudo dnf install mangohud
```

No Bazzite, o MangoHud normalmente já vem instalado. Verifique com:

```bash
mangohud --version
```

**Ubuntu, Debian e Linux Mint:**

```bash
sudo apt update
sudo apt install mangohud
```

**Arch Linux, Manjaro e EndeavourOS:**

```bash
sudo pacman -S mangohud
```

**openSUSE:**

```bash
sudo zypper install mangohud
```

### Instalação do Eden Gaming

```bash
chmod +x eden-gaming/eden-gaming-simples.sh
./eden-gaming/eden-gaming-simples.sh --install
```

O comando instala o inicializador no perfil do usuário e cria o atalho
**Eden Gaming** no menu de aplicativos. Use `Shift direito + F12` para ocultar
ou exibir o painel durante o jogo.

Também é possível executá-lo diretamente, sem instalar o atalho:

```bash
./eden-gaming/eden-gaming-simples.sh
```

## Cache opcional de shaders

O cache de shaders pode reduzir travamentos causados pela compilação de shaders
e pipelines Vulkan durante a exploração. Ele é opcional e não está armazenado
neste repositório devido ao tamanho dos arquivos.

Arquivos esperados:

```text
vulkan.bin
vulkan_pipelines.bin
```

[**Baixar cache de shaders pelo Google Drive**](https://drive.google.com/file/d/1eZ9Hc0gY-xFsb7pF6Lk5p9Qge_suLvJn/view?usp=sharing)

> A compatibilidade do cache pode variar conforme a versão do Eden, GPU e
> driver Vulkan. Faça backup dos arquivos existentes antes de substituí-los.

## Compatibilidade e créditos

- Compatibilidade exclusiva: TOTK 1.2.1.
- Não instale os perfis UltraCam de 30 e 60 FPS simultaneamente.
- Créditos originais foram preservados no `config.yaml` de cada pacote e em
  [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
- Organização, manutenção e perfis dos demais mods: **aismor**.
- Tradução e dublagem: **Equipe Triforce Heroes**, sem atribuição a aismor.
- ROM, firmware, chaves, shaders e arquivos do jogo não são fornecidos.
