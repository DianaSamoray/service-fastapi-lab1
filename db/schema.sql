-- Чергування лікаря (варіант 22). Накочується автоматично при першому старті бази

CREATE TABLE IF NOT EXISTS shifts(
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  doctor TEXT NOT NULL,
  department TEXT NOT NULL,
  shift_date DATE NOT NULL,
  beginning_time TEXT NOT NULL,
  duration_hours SMALLINT NOT NULL CHECK(duration_hours BETWEEN 4 AND 24),
  shift_type TEXT NOT NULL
);

-- Під фільтр і порядок у переліку: WHERE department=department ORDER BY id
CREATE INDEX IF NOT EXISTS idx_shifts_department_id
  ON shifts (department, id);
