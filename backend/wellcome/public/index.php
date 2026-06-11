<?php

declare(strict_types=1);

header('Content-Type: text/html; charset=UTF-8');

$phpVersion = PHP_VERSION;
$currentTime = (new DateTimeImmutable('now', new DateTimeZone('America/Mexico_City')))
    ->format('d/m/Y H:i:s');
?>
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Backend listo</title>
    <style>
        :root { color-scheme: dark; --ink: #f3f0e8; --muted: #9ca3a8; --line: #31383b; --accent: #f5c451; }
        * { box-sizing: border-box; }
        body { margin: 0; min-height: 100vh; display: grid; place-items: center; overflow: hidden; background: #111719; color: var(--ink); font-family: Georgia, "Times New Roman", serif; }
        body::before { content: ""; position: fixed; inset: 0; opacity: .22; background-image: linear-gradient(var(--line) 1px, transparent 1px), linear-gradient(90deg, var(--line) 1px, transparent 1px); background-size: 42px 42px; transform: perspective(500px) rotateX(55deg) scale(1.7) translateY(20%); }
        main { position: relative; width: min(760px, calc(100% - 32px)); padding: clamp(32px, 7vw, 72px); border: 1px solid var(--line); background: rgba(18, 25, 27, .92); box-shadow: 18px 18px 0 #090d0e; }
        .eyebrow { margin: 0 0 28px; color: var(--accent); font: 700 12px/1 monospace; letter-spacing: .22em; text-transform: uppercase; }
        h1 { max-width: 600px; margin: 0; font-size: clamp(50px, 10vw, 104px); font-weight: 400; line-height: .86; letter-spacing: -.06em; }
        h1 em { color: var(--accent); font-style: italic; }
        .lead { max-width: 500px; margin: 34px 0; color: var(--muted); font: 16px/1.7 monospace; }
        dl { display: grid; grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 1px; margin: 0; background: var(--line); border: 1px solid var(--line); }
        div { padding: 18px; background: #111719; }
        dt { color: var(--muted); font: 10px/1 monospace; letter-spacing: .16em; text-transform: uppercase; }
        dd { margin: 9px 0 0; font: 700 14px/1.2 monospace; }
        @media (max-width: 520px) { dl { grid-template-columns: 1fr; } main { box-shadow: 9px 9px 0 #090d0e; } }
    </style>
</head>
<body>
<main>
    <p class="eyebrow">Backend / API</p>
    <h1>Backend <em>listo.</em></h1>
    <p class="lead">Funcionando mejor de lo que esperaba.</p>
    <dl>
        <div><dt>Servicio</dt><dd>php-app:9000</dd></div>
        <div><dt>PHP</dt><dd><?= htmlspecialchars($phpVersion, ENT_QUOTES, 'UTF-8') ?></dd></div>
        <div><dt>Ruta</dt><dd>api.wellcome.local.com</dd></div>
        <div><dt>Hora local</dt><dd><?= htmlspecialchars($currentTime, ENT_QUOTES, 'UTF-8') ?></dd></div>
    </dl>
</main>
</body>
</html>
