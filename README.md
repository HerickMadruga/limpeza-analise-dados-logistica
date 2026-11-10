# 🛒 Limpeza de Dados e Análise Logística de E-commerce (OTIF)

## 📌 O Problema de Negócio
A ineficiência logística e os atrasos nas entregas são os principais fatores de insatisfação num e-commerce, afetando diretamente a taxa de recompra (LTV) e a reputação da marca. 

Este projeto tem como objetivo processar uma base de dados brutos de pedidos, realizar a limpeza e modelagem dos dados, e extrair métricas de **OTIF (On-Time In-Full)** para identificar gargalos regionais e calcular o impacto financeiro/reputacional dos atrasos.

## 🛠️ Stack Tecnológica e Habilidades Aplicadas
* **Ferramenta:** PostgreSQL
* **Técnicas de SQL:** 
  * Estruturação de Banco de Dados (DDL: `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`)
  * Limpeza e Modelagem de Dados (`CREATE VIEW`)
  * Tratamento de Datas (`EXTRACT(EPOCH FROM ...)`)
  * Lógica Condicional (`CASE WHEN`)
  * Agregações Matemáticas e Joins (`SUM`, `AVG`, `ROUND`, `JOIN`, `GROUP BY`, `HAVING`)

## 📂 Estrutura do Projeto
O pipeline de dados foi dividido em 3 etapas principais:

1. **`01_criacao_tabelas.sql`**: Criação da infraestrutura relacional, garantindo a integridade dos dados entre Clientes, Pedidos e Avaliações.
2. **`02_limpeza_dados_logistica.sql`**: Script de limpeza que remove dados nulos, filtra pedidos entregues e calcula o *lead time* real criando uma `VIEW` otimizada para ferramentas de BI.
3. **`03_extracao_insights_otif.sql`**: Queries analíticas para responder às perguntas de negócio.

## 📊 Principais Insights Extraídos

### 1. Gargalos Logísticos por Estado
A análise revelou que os estados do **MA** e **RJ** apresentam as maiores taxas percentuais de atraso (acima da média nacional). Num cenário real corporativo, este dado justificaria a revisão imediata dos SLAs de entrega e renegociação com transportadoras locais.

*(Adicione aqui a sua imagem: `![Tabela de Atrasos](imagens/sua_imagem_atrasos.png)`)*

### 2. Impacto do Atraso na Satisfação do Cliente (Reviews)
O cruzamento da tabela de frete com a tabela de avaliações provou matematicamente o custo da ineficiência:
* Pedidos **Entregues no Prazo** mantêm uma nota média alta (Ex: ~4.2).
* Pedidos **Entregues com Atraso** sofrem uma queda drástica na nota média (Ex: ~1.5).

*(Adicione aqui a sua imagem: `![Tabela de Avaliações](imagens/sua_imagem_avaliacoes.png)`)*

## 🚀 Como Executar
1. Clone este repositório.
2. Execute o ficheiro `01_criacao_tabelas.sql` no seu SGBD PostgreSQL.
3. Importe os seus dados CSV para as tabelas respetivas.
4. Execute os ficheiros `02` e `03` para processar a limpeza e gerar as métricas de negócio.

---
*Projeto desenvolvido para compor portfólio de Business Intelligence e Análise de Dados.*
