# Base escolhida para a normalizacao

A base escolhida e **L/ha**.

Ela foi escolhida porque a area da aplicacao e expressa em hectares e as
funcoes de calculo por area podem usar diretamente uma dose normalizada.

## Fluxo

```text
                   Inicio
                     |
                     v
              Recebe dose + unidade
                     |
             +-------+-------+
             |               |
           L/ha           L/1000L
             |               |
             v               v
       Mantem dose       Usa taxa L/ha
             |               |
             |               v
             |        dose * (taxa / 1000)
             |               |
             +-------+-------+
                     |
                     v
                   L/ha
```

## Exemplos

- `2 L/ha` permanece `2 L/ha`.
- `1 L/1000 L` com taxa `40 L/ha` vira `0,04 L/ha`.

A taxa de aplicacao sempre entra por parametro, evitando valores fixos
dentro da funcao.
