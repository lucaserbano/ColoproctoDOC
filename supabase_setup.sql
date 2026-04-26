-- ColoproctoDOC — Configuração do banco de dados no Supabase
-- Execute este script no SQL Editor do seu projeto Supabase

-- Tabela principal
CREATE TABLE monthly_expenses (
  id         UUID        PRIMARY KEY DEFAULT gen_random_uuid(),
  month_year TEXT        NOT NULL UNIQUE,
  data       JSONB       NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Trigger para atualizar updated_at automaticamente
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_monthly_expenses_updated_at
BEFORE UPDATE ON monthly_expenses
FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- Row Level Security: habilita e permite acesso total via chave anônima
-- (ferramenta interna — sem autenticação de usuários)
ALTER TABLE monthly_expenses ENABLE ROW LEVEL SECURITY;

CREATE POLICY "acesso_anonimo_total" ON monthly_expenses
  FOR ALL TO anon
  USING (true)
  WITH CHECK (true);
