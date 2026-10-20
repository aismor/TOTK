# Perfil de desempenho da CPU no Linux

Define o governor `performance` quando oferecido pelo driver da CPU e habilita
os C-states expostos pelo kernel. O script ignora recursos indisponíveis, por
isso pode ser usado em várias distribuições e em CPUs Intel ou AMD.

## Instalação

Em distribuições com systemd (Fedora, Bazzite, Ubuntu, Debian, Arch e outras):

```bash
sudo ./instalar.sh
```

Sem systemd, execute diretamente ou integre ao mecanismo de inicialização da
distribuição:

```bash
sudo ./cpu-perf-max.sh
```

## Observações

- Exige Linux e privilégios de administrador.
- O governor `performance` pode aumentar consumo, temperatura e ruído.
- O firmware, o driver da CPU ou ferramentas como `tuned` podem substituir a
  configuração posteriormente.
- Habilitar C-states não desativa o turbo; em alguns computadores ajuda os
  núcleos ativos a alcançar frequências maiores.
- Projeto e manutenção: aismor — <https://github.com/aismor/TOTK.git>
