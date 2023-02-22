USE waitlist;
INSERT INTO admin (character_id, role, granted_at, granted_by_id)
SELECT
    id AS character_id,
    'council' AS role,
    CURRENT_TIMESTAMP() AS granted_at,
    id AS granted_by_id
FROM `character` WHERE name = 'Murmmur';
## Quit the shell using 'exit;'