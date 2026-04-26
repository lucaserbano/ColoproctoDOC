# ColoproctoDOC — Contas do Consultório

## Configuração inicial (fazer uma vez)

### 1. Criar projeto no Supabase

1. Acesse [supabase.com](https://supabase.com) e crie uma conta gratuita
2. Clique em **New Project**, escolha um nome (ex: `coloproctodoc`) e uma senha forte
3. Aguarde o projeto ser criado (~1 minuto)

### 2. Criar a tabela no banco

1. No painel do projeto, vá em **SQL Editor** (menu lateral)
2. Cole o conteúdo do arquivo `supabase_setup.sql` e clique em **Run**
3. Confirme que a tabela `monthly_expenses` aparece em **Table Editor**

### 3. Obter as credenciais

1. Vá em **Project Settings → API** (ícone de engrenagem no menu lateral)
2. Copie:
   - **Project URL** (ex: `https://abcdefgh.supabase.co`)
   - **anon / public** key (a chave longa que começa com `eyJ...`)

### 4. Configurar o arquivo index.html

Abra `index.html` em qualquer editor de texto e edite as duas linhas no início do `<script>`:

```js
const SUPABASE_URL      = 'https://SEU_PROJETO.supabase.co';   // ← cole o Project URL aqui
const SUPABASE_ANON_KEY = 'SUA_ANON_KEY_AQUI';                 // ← cole a anon key aqui
```

### 5. Usar o aplicativo

Basta abrir o arquivo `index.html` diretamente no navegador (Chrome ou Firefox).
Não é necessário servidor — o arquivo funciona como página local.

Para compartilhar com o outro médico, envie o arquivo `index.html` editado.
Como os dados ficam no Supabase, ambos verão e editarão as mesmas informações.

---

## Como usar

- **Selecione o ano** com as setas `‹` e `›` no canto superior direito
- **Selecione o mês** clicando nas abas (Jan, Fev, Mar…)
- **Preencha os valores** de cada despesa e escolha quem pagou
- Os dados são **salvos automaticamente** em ~1 segundo após cada alteração
- O **Resumo do Mês** no final da página mostra:
  - Cota de cada médico (quanto cada um deve pagar)
  - Quanto cada um efetivamente pagou
  - Saldo e quem deve ao outro

## Campo "Quem pagou"

- **Norton** ou **Eron**: um dos dois pagou a conta inteira
- **Ambos**: cada um pagou a própria cota diretamente (sem necessidade de reembolso)

## Extras

Use a seção de Extras para despesas como CRM, consertos, alvarás, etc.
Para cada extra, insira o valor que **Norton** deve e o que **Eron** deve separadamente.
Despesas 50/50: coloque o mesmo valor para ambos.
